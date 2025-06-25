# Tokenized Facilities Space Utilization Management

A comprehensive blockchain-based system for managing facilities space utilization, built on the Stacks blockchain using Clarity smart contracts.

## Overview

This system provides a complete solution for facilities management through tokenized space allocation, utilization tracking, and cost optimization. The platform enables organizations to efficiently manage their physical spaces while maintaining transparency and accountability through blockchain technology.

## Features

### 🏢 Core Functionality

- **Space Planner Verification**: Validates and manages certified space planners
- **Utilization Tracking**: Real-time monitoring of space occupancy and utilization rates
- **Optimization Planning**: AI-driven recommendations for space optimization
- **Allocation Management**: Automated space allocation and tenant management
- **Cost Efficiency**: Cost tracking and optimization analytics

### 🔐 Security & Compliance

- Blockchain-based transparency and immutability
- Role-based access control
- Verified planner certification system
- Audit trail for all space-related transactions

## Smart Contracts

### v1 Contracts

1. **space-planner-verification.clar**
    - Manages certified space planners
    - Verification and revocation functions
    - Planner details and certification tracking

2. **utilization-tracking.clar**
    - Tracks space occupancy in real-time
    - Historical utilization data
    - Automated utilization rate calculations

3. **optimization-planning.clar**
    - Creates and manages optimization plans
    - Recommendation system
    - Plan approval and implementation workflow

4. **allocation-management.clar**
    - Space allocation and assignment
    - Tenant management
    - Capacity planning and validation

5. **cost-efficiency.clar**
    - Cost tracking and analysis
    - Efficiency metrics calculation
    - Savings tracking and reporting

## Getting Started

### Prerequisites

- Stacks blockchain node
- Clarity CLI tools
- Node.js (for testing)

### Installation

1. Clone the repository:
   \`\`\`bash
   git clone https://github.com/your-org/tokenized-facilities-management
   cd tokenized-facilities-management
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

### Deployment

Deploy contracts to Stacks testnet:

\`\`\`bash
# Deploy space planner verification
clarinet deploy --testnet contracts/v1/space-planner-verification.clar

# Deploy utilization tracking
clarinet deploy --testnet contracts/v1/utilization-tracking.clar

# Deploy optimization planning
clarinet deploy --testnet contracts/v1/optimization-planning.clar

# Deploy allocation management
clarinet deploy --testnet contracts/v1/allocation-management.clar

# Deploy cost efficiency
clarinet deploy --testnet contracts/v1/cost-efficiency.clar
\`\`\`

## Usage Examples

### Verify a Space Planner

\`\`\`clarity
(contract-call? .space-planner-verification verify-planner
'SP1234567890ABCDEF
"John Doe"
"Certified Space Planner - Level 3")
\`\`\`

### Create a Space

\`\`\`clarity
(contract-call? .utilization-tracking create-space "Conference Room A" u50)
\`\`\`

### Update Space Occupancy

\`\`\`clarity
(contract-call? .utilization-tracking update-occupancy u1 u35)
\`\`\`

### Allocate Space

\`\`\`clarity
(contract-call? .allocation-management allocate-space
u1
'SP1234567890ABCDEF
u25
u8760) ;; 1 year in blocks
\`\`\`

## API Reference

### Space Planner Verification

- \`verify-planner(planner, name, certification)\` - Verify a space planner
- \`revoke-verification(planner)\` - Revoke planner verification
- \`is-verified-planner(planner)\` - Check if planner is verified

### Utilization Tracking

- \`create-space(name, capacity)\` - Create a new space
- \`update-occupancy(space-id, occupancy)\` - Update space occupancy
- \`get-utilization-rate(space-id)\` - Get current utilization rate

### Optimization Planning

- \`create-optimization-plan(space-id, target-utilization, estimated-savings, recommendations)\` - Create optimization plan
- \`approve-plan(plan-id)\` - Approve an optimization plan
- \`implement-plan(plan-id)\` - Mark plan as implemented

### Allocation Management

- \`allocate-space(space-id, tenant, capacity, duration)\` - Allocate space to tenant
- \`release-allocation(allocation-id)\` - Release space allocation
- \`get-allocated-capacity(space-id)\` - Get total allocated capacity

### Cost Efficiency

- \`set-space-costs(space-id, rent, utilities, maintenance, sqft)\` - Set space costs
- \`calculate-efficiency(space-id, utilization-rate)\` - Calculate efficiency metrics
- \`record-cost-savings(space-id, savings)\` - Record cost savings

## Testing

The project includes comprehensive tests using Vitest:

\`\`\`bash
npm test
\`\`\`

Test files are located in the \`tests/\` directory and cover:
- Contract deployment and initialization
- Function calls and error handling
- Data integrity and validation
- Integration between contracts

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions:
- Create an issue on GitHub
- Contact the development team
- Check the documentation wiki

## Roadmap

### v2 Features (Planned)
- NFT-based space tokens
- Advanced analytics dashboard
- Integration with IoT sensors
- Mobile application
- Multi-tenant support
- Automated billing system

### v3 Features (Future)
- AI-powered space optimization
- Predictive analytics
- Integration with building management systems
- Carbon footprint tracking
- Sustainability metrics
  \`\`\`

