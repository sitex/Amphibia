import SwiftUI
import MapKit

struct ContactsView: View {
    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: CompanyInfo.latitude,
                longitude: CompanyInfo.longitude
            ),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    )

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Map
                    Map(position: $cameraPosition) {
                        Marker(CompanyInfo.name, coordinate: CLLocationCoordinate2D(
                            latitude: CompanyInfo.latitude,
                            longitude: CompanyInfo.longitude
                        ))
                    }
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal)

                    // Contact Cards
                    VStack(spacing: 16) {
                        ContactCard(
                            icon: "mappin.circle.fill",
                            title: "Адрес",
                            value: CompanyInfo.fullAddress,
                            action: nil
                        )

                        ContactCard(
                            icon: "phone.circle.fill",
                            title: "Телефон",
                            value: CompanyInfo.phone,
                            action: {
                                if let url = URL(string: CompanyInfo.phoneURL) {
                                    UIApplication.shared.open(url)
                                }
                            }
                        )

                        ContactCard(
                            icon: "envelope.circle.fill",
                            title: "Email",
                            value: CompanyInfo.email,
                            action: {
                                if let url = URL(string: CompanyInfo.emailURL) {
                                    UIApplication.shared.open(url)
                                }
                            }
                        )
                    }
                    .padding(.horizontal)

                    // CTA Button
                    Button(action: {
                        if let url = URL(string: CompanyInfo.emailURL + "?subject=Обсуждение проекта") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text("Обсудить проект")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accentColor)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 32)
                }
                .padding(.top)
            }
            .navigationTitle("Контакты")
        }
    }
}

struct ContactCard: View {
    let icon: String
    let title: String
    let value: String
    let action: (() -> Void)?

    var body: some View {
        Button(action: { action?() }) {
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .font(.title)
                    .foregroundStyle(.accentColor)
                    .frame(width: 44)

                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    Text(value)
                        .font(.body)
                        .foregroundStyle(.primary)
                }

                Spacer()

                if action != nil {
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .buttonStyle(.plain)
        .disabled(action == nil)
    }
}

#Preview {
    ContactsView()
}
