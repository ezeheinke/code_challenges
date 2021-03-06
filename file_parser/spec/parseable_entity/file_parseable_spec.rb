# frozen_string_literal: true

require 'spec_helper'

describe ParseableEntity::FileParseable do
  describe '#parse' do
    subject { described_class.new(source: source, parsing_rules: rules) }
    context 'when the file is missing' do
      let(:rules) { double(:rules) }
      let(:source) { 'missing_file.txt' }
      it do
        expect do
          subject.parse
        end.to raise_error(ParseableEntity::FileParseable::FileMissing, 'The file provided does not exist')
      end
    end

    context 'when the file exists' do
      let(:rules) { Util::ServerlogParsingRules }
      let(:source) { 'webserver.log' }
      let(:expected_result) do
        [{ visited_page: '/help_page/1', user_id: '126.318.035.038' },
         { visited_page: '/contact', user_id: '184.123.665.067' },
         { visited_page: '/home', user_id: '184.123.665.067' },
         { visited_page: '/about/2', user_id: '444.701.448.104' },
         { visited_page: '/help_page/1', user_id: '929.398.951.889' },
         { visited_page: '/index', user_id: '444.701.448.104' },
         { visited_page: '/help_page/1', user_id: '722.247.931.582' },
         { visited_page: '/about', user_id: '061.945.150.735' },
         { visited_page: '/help_page/1', user_id: '646.865.545.408' },
         { visited_page: '/home', user_id: '235.313.352.950' },
         { visited_page: '/contact', user_id: '184.123.665.067' },
         { visited_page: '/help_page/1', user_id: '543.910.244.929' },
         { visited_page: '/home', user_id: '316.433.849.805' },
         { visited_page: '/about/2', user_id: '444.701.448.104' },
         { visited_page: '/contact', user_id: '543.910.244.929' },
         { visited_page: '/about', user_id: '126.318.035.038' },
         { visited_page: '/about/2', user_id: '836.973.694.403' },
         { visited_page: '/index', user_id: '316.433.849.805' },
         { visited_page: '/index', user_id: '802.683.925.780' },
         { visited_page: '/help_page/1', user_id: '929.398.951.889' },
         { visited_page: '/contact', user_id: '555.576.836.194' },
         { visited_page: '/about/2', user_id: '184.123.665.067' },
         { visited_page: '/home', user_id: '444.701.448.104' },
         { visited_page: '/index', user_id: '929.398.951.889' },
         { visited_page: '/about', user_id: '235.313.352.950' },
         { visited_page: '/contact', user_id: '200.017.277.774' },
         { visited_page: '/about', user_id: '836.973.694.403' },
         { visited_page: '/contact', user_id: '316.433.849.805' },
         { visited_page: '/help_page/1', user_id: '929.398.951.889' },
         { visited_page: '/about/2', user_id: '382.335.626.855' },
         { visited_page: '/home', user_id: '336.284.013.698' },
         { visited_page: '/about', user_id: '929.398.951.889' },
         { visited_page: '/help_page/1', user_id: '836.973.694.403' },
         { visited_page: '/contact', user_id: '836.973.694.403' },
         { visited_page: '/home', user_id: '444.701.448.104' },
         { visited_page: '/about/2', user_id: '543.910.244.929' },
         { visited_page: '/about', user_id: '715.156.286.412' },
         { visited_page: '/contact', user_id: '184.123.665.067' },
         { visited_page: '/home', user_id: '444.701.448.104' },
         { visited_page: '/index', user_id: '184.123.665.067' },
         { visited_page: '/about', user_id: '336.284.013.698' },
         { visited_page: '/home', user_id: '382.335.626.855' },
         { visited_page: '/home', user_id: '802.683.925.780' },
         { visited_page: '/about', user_id: '715.156.286.412' },
         { visited_page: '/about/2', user_id: '555.576.836.194' },
         { visited_page: '/home', user_id: '451.106.204.921' },
         { visited_page: '/about', user_id: '722.247.931.582' },
         { visited_page: '/contact', user_id: '158.577.775.616' },
         { visited_page: '/about', user_id: '715.156.286.412' },
         { visited_page: '/about', user_id: '897.280.786.156' },
         { visited_page: '/home', user_id: '897.280.786.156' },
         { visited_page: '/home', user_id: '715.156.286.412' },
         { visited_page: '/contact', user_id: '158.577.775.616' },
         { visited_page: '/help_page/1', user_id: '316.433.849.805' },
         { visited_page: '/home', user_id: '836.973.694.403' },
         { visited_page: '/contact', user_id: '836.973.694.403' },
         { visited_page: '/help_page/1', user_id: '184.123.665.067' },
         { visited_page: '/home', user_id: '555.576.836.194' },
         { visited_page: '/help_page/1', user_id: '158.577.775.616' },
         { visited_page: '/index', user_id: '158.577.775.616' },
         { visited_page: '/help_page/1', user_id: '543.910.244.929' },
         { visited_page: '/about/2', user_id: '802.683.925.780' },
         { visited_page: '/about/2', user_id: '200.017.277.774' },
         { visited_page: '/about', user_id: '016.464.657.359' },
         { visited_page: '/help_page/1', user_id: '158.577.775.616' },
         { visited_page: '/about', user_id: '061.945.150.735' },
         { visited_page: '/about', user_id: '802.683.925.780' },
         { visited_page: '/about', user_id: '543.910.244.929' },
         { visited_page: '/contact', user_id: '016.464.657.359' },
         { visited_page: '/help_page/1', user_id: '682.704.613.213' },
         { visited_page: '/about', user_id: '543.910.244.929' },
         { visited_page: '/about/2', user_id: '126.318.035.038' },
         { visited_page: '/about/2', user_id: '451.106.204.921' },
         { visited_page: '/help_page/1', user_id: '929.398.951.889' },
         { visited_page: '/contact', user_id: '682.704.613.213' },
         { visited_page: '/help_page/1', user_id: '217.511.476.080' },
         { visited_page: '/about/2', user_id: '235.313.352.950' },
         { visited_page: '/contact', user_id: '682.704.613.213' },
         { visited_page: '/about/2', user_id: '555.576.836.194' },
         { visited_page: '/about', user_id: '016.464.657.359' },
         { visited_page: '/index', user_id: '897.280.786.156' },
         { visited_page: '/about/2', user_id: '184.123.665.067' },
         { visited_page: '/index', user_id: '555.576.836.194' },
         { visited_page: '/home', user_id: '646.865.545.408' },
         { visited_page: '/home', user_id: '217.511.476.080' },
         { visited_page: '/about', user_id: '316.433.849.805' },
         { visited_page: '/about/2', user_id: '200.017.277.774' },
         { visited_page: '/home', user_id: '715.156.286.412' },
         { visited_page: '/index', user_id: '200.017.277.774' },
         { visited_page: '/help_page/1', user_id: '836.973.694.403' },
         { visited_page: '/about/2', user_id: '836.973.694.403' },
         { visited_page: '/about/2', user_id: '217.511.476.080' },
         { visited_page: '/index', user_id: '158.577.775.616' },
         { visited_page: '/home', user_id: '451.106.204.921' },
         { visited_page: '/contact', user_id: '444.701.448.104' },
         { visited_page: '/index', user_id: '722.247.931.582' },
         { visited_page: '/about', user_id: '235.313.352.950' },
         { visited_page: '/home', user_id: '235.313.352.950' },
         { visited_page: '/help_page/1', user_id: '016.464.657.359' },
         { visited_page: '/contact', user_id: '316.433.849.805' },
         { visited_page: '/about', user_id: '836.973.694.403' },
         { visited_page: '/home', user_id: '235.313.352.950' },
         { visited_page: '/help_page/1', user_id: '451.106.204.921' },
         { visited_page: '/index', user_id: '451.106.204.921' },
         { visited_page: '/about', user_id: '836.973.694.403' },
         { visited_page: '/about', user_id: '451.106.204.921' },
         { visited_page: '/about/2', user_id: '382.335.626.855' },
         { visited_page: '/about/2', user_id: '316.433.849.805' },
         { visited_page: '/about', user_id: '016.464.657.359' },
         { visited_page: '/about', user_id: '555.576.836.194' },
         { visited_page: '/about', user_id: '336.284.013.698' },
         { visited_page: '/about/2', user_id: '184.123.665.067' },
         { visited_page: '/contact', user_id: '802.683.925.780' },
         { visited_page: '/index', user_id: '158.577.775.616' },
         { visited_page: '/about/2', user_id: '061.945.150.735' },
         { visited_page: '/contact', user_id: '682.704.613.213' },
         { visited_page: '/home', user_id: '682.704.613.213' },
         { visited_page: '/about/2', user_id: '715.156.286.412' },
         { visited_page: '/help_page/1', user_id: '897.280.786.156' },
         { visited_page: '/about', user_id: '158.577.775.616' },
         { visited_page: '/help_page/1', user_id: '722.247.931.582' },
         { visited_page: '/help_page/1', user_id: '382.335.626.855' },
         { visited_page: '/contact', user_id: '382.335.626.855' },
         { visited_page: '/index', user_id: '451.106.204.921' },
         { visited_page: '/about', user_id: '061.945.150.735' },
         { visited_page: '/about', user_id: '126.318.035.038' },
         { visited_page: '/help_page/1', user_id: '235.313.352.950' },
         { visited_page: '/about/2', user_id: '543.910.244.929' },
         { visited_page: '/about', user_id: '682.704.613.213' },
         { visited_page: '/help_page/1', user_id: '217.511.476.080' },
         { visited_page: '/about/2', user_id: '184.123.665.067' },
         { visited_page: '/index', user_id: '451.106.204.921' },
         { visited_page: '/home', user_id: '200.017.277.774' },
         { visited_page: '/about/2', user_id: '646.865.545.408' },
         { visited_page: '/home', user_id: '382.335.626.855' },
         { visited_page: '/help_page/1', user_id: '897.280.786.156' },
         { visited_page: '/index', user_id: '217.511.476.080' },
         { visited_page: '/contact', user_id: '184.123.665.067' },
         { visited_page: '/about', user_id: '061.945.150.735' },
         { visited_page: '/index', user_id: '897.280.786.156' },
         { visited_page: '/about/2', user_id: '316.433.849.805' },
         { visited_page: '/help_page/1', user_id: '016.464.657.359' },
         { visited_page: '/about', user_id: '715.156.286.412' },
         { visited_page: '/index', user_id: '929.398.951.889' },
         { visited_page: '/home', user_id: '444.701.448.104' },
         { visited_page: '/help_page/1', user_id: '646.865.545.408' },
         { visited_page: '/contact', user_id: '722.247.931.582' },
         { visited_page: '/index', user_id: '451.106.204.921' },
         { visited_page: '/about', user_id: '722.247.931.582' },
         { visited_page: '/help_page/1', user_id: '184.123.665.067' },
         { visited_page: '/about/2', user_id: '016.464.657.359' },
         { visited_page: '/about/2', user_id: '200.017.277.774' },
         { visited_page: '/about/2', user_id: '543.910.244.929' },
         { visited_page: '/help_page/1', user_id: '444.701.448.104' },
         { visited_page: '/index', user_id: '836.973.694.403' },
         { visited_page: '/contact', user_id: '126.318.035.038' },
         { visited_page: '/about/2', user_id: '444.701.448.104' },
         { visited_page: '/contact', user_id: '336.284.013.698' },
         { visited_page: '/help_page/1', user_id: '722.247.931.582' },
         { visited_page: '/contact', user_id: '722.247.931.582' },
         { visited_page: '/home', user_id: '061.945.150.735' },
         { visited_page: '/about/2', user_id: '016.464.657.359' },
         { visited_page: '/contact', user_id: '382.335.626.855' },
         { visited_page: '/contact', user_id: '451.106.204.921' },
         { visited_page: '/home', user_id: '543.910.244.929' },
         { visited_page: '/home', user_id: '555.576.836.194' },
         { visited_page: '/contact', user_id: '158.577.775.616' },
         { visited_page: '/home', user_id: '722.247.931.582' },
         { visited_page: '/contact', user_id: '158.577.775.616' },
         { visited_page: '/help_page/1', user_id: '451.106.204.921' },
         { visited_page: '/index', user_id: '451.106.204.921' },
         { visited_page: '/about/2', user_id: '016.464.657.359' },
         { visited_page: '/home', user_id: '016.464.657.359' },
         { visited_page: '/index', user_id: '382.335.626.855' },
         { visited_page: '/home', user_id: '897.280.786.156' },
         { visited_page: '/about', user_id: '382.335.626.855' },
         { visited_page: '/help_page/1', user_id: '316.433.849.805' },
         { visited_page: '/home', user_id: '722.247.931.582' },
         { visited_page: '/about/2', user_id: '316.433.849.805' },
         { visited_page: '/about/2', user_id: '897.280.786.156' },
         { visited_page: '/about', user_id: '336.284.013.698' },
         { visited_page: '/help_page/1', user_id: '682.704.613.213' },
         { visited_page: '/about/2', user_id: '682.704.613.213' },
         { visited_page: '/contact', user_id: '158.577.775.616' },
         { visited_page: '/index', user_id: '543.910.244.929' },
         { visited_page: '/home', user_id: '316.433.849.805' },
         { visited_page: '/index', user_id: '158.577.775.616' },
         { visited_page: '/index', user_id: '444.701.448.104' },
         { visited_page: '/home', user_id: '158.577.775.616' },
         { visited_page: '/about/2', user_id: '555.576.836.194' },
         { visited_page: '/contact', user_id: '382.335.626.855' },
         { visited_page: '/home', user_id: '836.973.694.403' },
         { visited_page: '/index', user_id: '126.318.035.038' },
         { visited_page: '/home', user_id: '543.910.244.929' },
         { visited_page: '/contact', user_id: '897.280.786.156' },
         { visited_page: '/help_page/1', user_id: '646.865.545.408' },
         { visited_page: '/about', user_id: '682.704.613.213' },
         { visited_page: '/contact', user_id: '316.433.849.805' },
         { visited_page: '/home', user_id: '451.106.204.921' },
         { visited_page: '/about/2', user_id: '722.247.931.582' },
         { visited_page: '/about/2', user_id: '897.280.786.156' },
         { visited_page: '/index', user_id: '543.910.244.929' },
         { visited_page: '/index', user_id: '722.247.931.582' },
         { visited_page: '/about', user_id: '016.464.657.359' },
         { visited_page: '/help_page/1', user_id: '126.318.035.038' },
         { visited_page: '/home', user_id: '929.398.951.889' },
         { visited_page: '/home', user_id: '382.335.626.855' },
         { visited_page: '/home', user_id: '158.577.775.616' },
         { visited_page: '/help_page/1', user_id: '451.106.204.921' },
         { visited_page: '/home', user_id: '444.701.448.104' },
         { visited_page: '/index', user_id: '929.398.951.889' },
         { visited_page: '/index', user_id: '929.398.951.889' },
         { visited_page: '/home', user_id: '444.701.448.104' },
         { visited_page: '/about', user_id: '897.280.786.156' },
         { visited_page: '/about/2', user_id: '897.280.786.156' },
         { visited_page: '/contact', user_id: '184.123.665.067' },
         { visited_page: '/help_page/1', user_id: '802.683.925.780' },
         { visited_page: '/index', user_id: '126.318.035.038' },
         { visited_page: '/about', user_id: '722.247.931.582' },
         { visited_page: '/index', user_id: '451.106.204.921' },
         { visited_page: '/contact', user_id: '555.576.836.194' },
         { visited_page: '/about/2', user_id: '158.577.775.616' },
         { visited_page: '/help_page/1', user_id: '316.433.849.805' },
         { visited_page: '/contact', user_id: '802.683.925.780' },
         { visited_page: '/help_page/1', user_id: '646.865.545.408' },
         { visited_page: '/contact', user_id: '217.511.476.080' },
         { visited_page: '/index', user_id: '897.280.786.156' },
         { visited_page: '/about/2', user_id: '316.433.849.805' },
         { visited_page: '/about/2', user_id: '016.464.657.359' },
         { visited_page: '/help_page/1', user_id: '382.335.626.855' },
         { visited_page: '/home', user_id: '555.576.836.194' },
         { visited_page: '/contact', user_id: '158.577.775.616' },
         { visited_page: '/index', user_id: '682.704.613.213' },
         { visited_page: '/contact', user_id: '184.123.665.067' },
         { visited_page: '/contact', user_id: '382.335.626.855' },
         { visited_page: '/contact', user_id: '336.284.013.698' },
         { visited_page: '/about/2', user_id: '715.156.286.412' },
         { visited_page: '/about', user_id: '682.704.613.213' },
         { visited_page: '/home', user_id: '336.284.013.698' },
         { visited_page: '/index', user_id: '316.433.849.805' },
         { visited_page: '/index', user_id: '382.335.626.855' },
         { visited_page: '/contact', user_id: '722.247.931.582' },
         { visited_page: '/contact', user_id: '184.123.665.067' },
         { visited_page: '/about', user_id: '836.973.694.403' },
         { visited_page: '/contact', user_id: '061.945.150.735' },
         { visited_page: '/about', user_id: '897.280.786.156' },
         { visited_page: '/home', user_id: '836.973.694.403' },
         { visited_page: '/index', user_id: '126.318.035.038' },
         { visited_page: '/contact', user_id: '543.910.244.929' },
         { visited_page: '/home', user_id: '543.910.244.929' },
         { visited_page: '/contact', user_id: '336.284.013.698' },
         { visited_page: '/contact', user_id: '646.865.545.408' },
         { visited_page: '/contact', user_id: '897.280.786.156' },
         { visited_page: '/about/2', user_id: '061.945.150.735' },
         { visited_page: '/about', user_id: '802.683.925.780' },
         { visited_page: '/contact', user_id: '184.123.665.067' },
         { visited_page: '/home', user_id: '235.313.352.950' },
         { visited_page: '/about/2', user_id: '555.576.836.194' },
         { visited_page: '/index', user_id: '444.701.448.104' },
         { visited_page: '/help_page/1', user_id: '451.106.204.921' },
         { visited_page: '/contact', user_id: '722.247.931.582' },
         { visited_page: '/help_page/1', user_id: '336.284.013.698' },
         { visited_page: '/contact', user_id: '722.247.931.582' },
         { visited_page: '/index', user_id: '444.701.448.104' },
         { visited_page: '/about', user_id: '061.945.150.735' },
         { visited_page: '/index', user_id: '836.973.694.403' },
         { visited_page: '/about/2', user_id: '235.313.352.950' },
         { visited_page: '/help_page/1', user_id: '722.247.931.582' },
         { visited_page: '/about/2', user_id: '184.123.665.067' },
         { visited_page: '/index', user_id: '184.123.665.067' },
         { visited_page: '/help_page/1', user_id: '715.156.286.412' },
         { visited_page: '/index', user_id: '016.464.657.359' },
         { visited_page: '/about/2', user_id: '646.865.545.408' },
         { visited_page: '/about', user_id: '897.280.786.156' },
         { visited_page: '/about/2', user_id: '061.945.150.735' },
         { visited_page: '/index', user_id: '158.577.775.616' },
         { visited_page: '/contact', user_id: '316.433.849.805' },
         { visited_page: '/index', user_id: '158.577.775.616' },
         { visited_page: '/about', user_id: '217.511.476.080' },
         { visited_page: '/about', user_id: '158.577.775.616' },
         { visited_page: '/index', user_id: '158.577.775.616' },
         { visited_page: '/help_page/1', user_id: '555.576.836.194' },
         { visited_page: '/home', user_id: '158.577.775.616' },
         { visited_page: '/about', user_id: '722.247.931.582' },
         { visited_page: '/about/2', user_id: '646.865.545.408' },
         { visited_page: '/about', user_id: '184.123.665.067' },
         { visited_page: '/home', user_id: '235.313.352.950' },
         { visited_page: '/home', user_id: '836.973.694.403' },
         { visited_page: '/about', user_id: '451.106.204.921' },
         { visited_page: '/about/2', user_id: '184.123.665.067' },
         { visited_page: '/home', user_id: '382.335.626.855' },
         { visited_page: '/contact', user_id: '722.247.931.582' },
         { visited_page: '/contact', user_id: '555.576.836.194' },
         { visited_page: '/about/2', user_id: '555.576.836.194' },
         { visited_page: '/about/2', user_id: '200.017.277.774' },
         { visited_page: '/help_page/1', user_id: '158.577.775.616' },
         { visited_page: '/contact', user_id: '316.433.849.805' },
         { visited_page: '/contact', user_id: '722.247.931.582' },
         { visited_page: '/contact', user_id: '451.106.204.921' },
         { visited_page: '/contact', user_id: '235.313.352.950' },
         { visited_page: '/about', user_id: '235.313.352.950' },
         { visited_page: '/about', user_id: '836.973.694.403' },
         { visited_page: '/home', user_id: '444.701.448.104' },
         { visited_page: '/contact', user_id: '184.123.665.067' },
         { visited_page: '/about/2', user_id: '200.017.277.774' },
         { visited_page: '/about', user_id: '646.865.545.408' },
         { visited_page: '/about/2', user_id: '836.973.694.403' },
         { visited_page: '/index', user_id: '543.910.244.929' },
         { visited_page: '/index', user_id: '722.247.931.582' },
         { visited_page: '/index', user_id: '382.335.626.855' },
         { visited_page: '/about/2', user_id: '382.335.626.855' },
         { visited_page: '/index', user_id: '217.511.476.080' },
         { visited_page: '/about', user_id: '682.704.613.213' },
         { visited_page: '/index', user_id: '836.973.694.403' },
         { visited_page: '/home', user_id: '682.704.613.213' },
         { visited_page: '/index', user_id: '235.313.352.950' },
         { visited_page: '/about/2', user_id: '061.945.150.735' },
         { visited_page: '/about', user_id: '543.910.244.929' },
         { visited_page: '/contact', user_id: '158.577.775.616' },
         { visited_page: '/about/2', user_id: '200.017.277.774' },
         { visited_page: '/help_page/1', user_id: '336.284.013.698' },
         { visited_page: '/home', user_id: '200.017.277.774' },
         { visited_page: '/home', user_id: '555.576.836.194' },
         { visited_page: '/home', user_id: '722.247.931.582' },
         { visited_page: '/about/2', user_id: '316.433.849.805' },
         { visited_page: '/index', user_id: '184.123.665.067' },
         { visited_page: '/index', user_id: '200.017.277.774' },
         { visited_page: '/about', user_id: '126.318.035.038' },
         { visited_page: '/help_page/1', user_id: '382.335.626.855' },
         { visited_page: '/about/2', user_id: '646.865.545.408' },
         { visited_page: '/index', user_id: '061.945.150.735' },
         { visited_page: '/about/2', user_id: '217.511.476.080' },
         { visited_page: '/about', user_id: '217.511.476.080' },
         { visited_page: '/contact', user_id: '316.433.849.805' },
         { visited_page: '/index', user_id: '722.247.931.582' },
         { visited_page: '/help_page/1', user_id: '382.335.626.855' },
         { visited_page: '/help_page/1', user_id: '235.313.352.950' },
         { visited_page: '/index', user_id: '836.973.694.403' },
         { visited_page: '/home', user_id: '802.683.925.780' },
         { visited_page: '/about/2', user_id: '158.577.775.616' },
         { visited_page: '/about/2', user_id: '836.973.694.403' },
         { visited_page: '/help_page/1', user_id: '382.335.626.855' },
         { visited_page: '/contact', user_id: '217.511.476.080' },
         { visited_page: '/home', user_id: '235.313.352.950' },
         { visited_page: '/about', user_id: '184.123.665.067' },
         { visited_page: '/home', user_id: '158.577.775.616' },
         { visited_page: '/help_page/1', user_id: '016.464.657.359' },
         { visited_page: '/index', user_id: '336.284.013.698' },
         { visited_page: '/index', user_id: '200.017.277.774' },
         { visited_page: '/contact', user_id: '715.156.286.412' },
         { visited_page: '/about', user_id: '451.106.204.921' },
         { visited_page: '/about/2', user_id: '444.701.448.104' },
         { visited_page: '/about', user_id: '682.704.613.213' },
         { visited_page: '/help_page/1', user_id: '158.577.775.616' },
         { visited_page: '/contact', user_id: '158.577.775.616' },
         { visited_page: '/index', user_id: '897.280.786.156' },
         { visited_page: '/about/2', user_id: '235.313.352.950' },
         { visited_page: '/index', user_id: '451.106.204.921' },
         { visited_page: '/help_page/1', user_id: '158.577.775.616' },
         { visited_page: '/contact', user_id: '715.156.286.412' },
         { visited_page: '/contact', user_id: '802.683.925.780' },
         { visited_page: '/contact', user_id: '646.865.545.408' },
         { visited_page: '/about', user_id: '543.910.244.929' },
         { visited_page: '/about/2', user_id: '715.156.286.412' },
         { visited_page: '/index', user_id: '200.017.277.774' },
         { visited_page: '/about/2', user_id: '184.123.665.067' },
         { visited_page: '/index', user_id: '646.865.545.408' },
         { visited_page: '/contact', user_id: '451.106.204.921' },
         { visited_page: '/contact', user_id: '929.398.951.889' },
         { visited_page: '/about/2', user_id: '382.335.626.855' },
         { visited_page: '/help_page/1', user_id: '682.704.613.213' },
         { visited_page: '/about/2', user_id: '682.704.613.213' },
         { visited_page: '/help_page/1', user_id: '836.973.694.403' },
         { visited_page: '/contact', user_id: '836.973.694.403' },
         { visited_page: '/about', user_id: '235.313.352.950' },
         { visited_page: '/about/2', user_id: '722.247.931.582' },
         { visited_page: '/home', user_id: '126.318.035.038' },
         { visited_page: '/contact', user_id: '382.335.626.855' },
         { visited_page: '/contact', user_id: '158.577.775.616' },
         { visited_page: '/contact', user_id: '126.318.035.038' },
         { visited_page: '/index', user_id: '016.464.657.359' },
         { visited_page: '/home', user_id: '061.945.150.735' },
         { visited_page: '/contact', user_id: '382.335.626.855' },
         { visited_page: '/help_page/1', user_id: '802.683.925.780' },
         { visited_page: '/home', user_id: '682.704.613.213' },
         { visited_page: '/about', user_id: '016.464.657.359' },
         { visited_page: '/help_page/1', user_id: '336.284.013.698' },
         { visited_page: '/about', user_id: '543.910.244.929' },
         { visited_page: '/help_page/1', user_id: '451.106.204.921' },
         { visited_page: '/index', user_id: '897.280.786.156' },
         { visited_page: '/index', user_id: '897.280.786.156' },
         { visited_page: '/help_page/1', user_id: '802.683.925.780' },
         { visited_page: '/about/2', user_id: '646.865.545.408' },
         { visited_page: '/index', user_id: '836.973.694.403' },
         { visited_page: '/about/2', user_id: '061.945.150.735' },
         { visited_page: '/index', user_id: '061.945.150.735' },
         { visited_page: '/about/2', user_id: '382.335.626.855' },
         { visited_page: '/help_page/1', user_id: '682.704.613.213' },
         { visited_page: '/about/2', user_id: '543.910.244.929' },
         { visited_page: '/index', user_id: '016.464.657.359' },
         { visited_page: '/about/2', user_id: '200.017.277.774' },
         { visited_page: '/about', user_id: '451.106.204.921' },
         { visited_page: '/about', user_id: '336.284.013.698' },
         { visited_page: '/contact', user_id: '316.433.849.805' },
         { visited_page: '/contact', user_id: '016.464.657.359' },
         { visited_page: '/contact', user_id: '217.511.476.080' },
         { visited_page: '/help_page/1', user_id: '336.284.013.698' },
         { visited_page: '/about', user_id: '722.247.931.582' },
         { visited_page: '/about/2', user_id: '336.284.013.698' },
         { visited_page: '/home', user_id: '316.433.849.805' },
         { visited_page: '/home', user_id: '316.433.849.805' },
         { visited_page: '/home', user_id: '543.910.244.929' },
         { visited_page: '/contact', user_id: '061.945.150.735' },
         { visited_page: '/about/2', user_id: '200.017.277.774' },
         { visited_page: '/about', user_id: '336.284.013.698' },
         { visited_page: '/home', user_id: '016.464.657.359' },
         { visited_page: '/index', user_id: '682.704.613.213' },
         { visited_page: '/contact', user_id: '543.910.244.929' },
         { visited_page: '/about', user_id: '451.106.204.921' },
         { visited_page: '/contact', user_id: '200.017.277.774' },
         { visited_page: '/about/2', user_id: '555.576.836.194' },
         { visited_page: '/index', user_id: '444.701.448.104' },
         { visited_page: '/about', user_id: '184.123.665.067' },
         { visited_page: '/contact', user_id: '836.973.694.403' },
         { visited_page: '/about', user_id: '316.433.849.805' },
         { visited_page: '/contact', user_id: '382.335.626.855' },
         { visited_page: '/help_page/1', user_id: '061.945.150.735' },
         { visited_page: '/home', user_id: '316.433.849.805' },
         { visited_page: '/home', user_id: '016.464.657.359' },
         { visited_page: '/help_page/1', user_id: '316.433.849.805' },
         { visited_page: '/home', user_id: '126.318.035.038' },
         { visited_page: '/contact', user_id: '722.247.931.582' },
         { visited_page: '/help_page/1', user_id: '158.577.775.616' },
         { visited_page: '/index', user_id: '715.156.286.412' },
         { visited_page: '/about/2', user_id: '184.123.665.067' },
         { visited_page: '/about/2', user_id: '184.123.665.067' },
         { visited_page: '/help_page/1', user_id: '802.683.925.780' },
         { visited_page: '/help_page/1', user_id: '451.106.204.921' },
         { visited_page: '/index', user_id: '451.106.204.921' },
         { visited_page: '/about/2', user_id: '444.701.448.104' },
         { visited_page: '/about/2', user_id: '543.910.244.929' },
         { visited_page: '/contact', user_id: '235.313.352.950' },
         { visited_page: '/home', user_id: '646.865.545.408' },
         { visited_page: '/home', user_id: '382.335.626.855' },
         { visited_page: '/index', user_id: '929.398.951.889' },
         { visited_page: '/index', user_id: '715.156.286.412' },
         { visited_page: '/help_page/1', user_id: '382.335.626.855' },
         { visited_page: '/index', user_id: '444.701.448.104' },
         { visited_page: '/help_page/1', user_id: '543.910.244.929' },
         { visited_page: '/home', user_id: '802.683.925.780' },
         { visited_page: '/index', user_id: '061.945.150.735' },
         { visited_page: '/help_page/1', user_id: '126.318.035.038' },
         { visited_page: '/about/2', user_id: '543.910.244.929' },
         { visited_page: '/contact', user_id: '715.156.286.412' },
         { visited_page: '/contact', user_id: '555.576.836.194' },
         { visited_page: '/about/2', user_id: '217.511.476.080' },
         { visited_page: '/help_page/1', user_id: '016.464.657.359' },
         { visited_page: '/about', user_id: '722.247.931.582' },
         { visited_page: '/help_page/1', user_id: '235.313.352.950' },
         { visited_page: '/help_page/1', user_id: '555.576.836.194' },
         { visited_page: '/contact', user_id: '646.865.545.408' },
         { visited_page: '/about', user_id: '646.865.545.408' },
         { visited_page: '/index', user_id: '200.017.277.774' },
         { visited_page: '/home', user_id: '200.017.277.774' },
         { visited_page: '/home', user_id: '646.865.545.408' },
         { visited_page: '/home', user_id: '722.247.931.582' },
         { visited_page: '/about/2', user_id: '016.464.657.359' },
         { visited_page: '/about', user_id: '184.123.665.067' },
         { visited_page: '/about/2', user_id: '722.247.931.582' },
         { visited_page: '/index', user_id: '126.318.035.038' },
         { visited_page: '/about', user_id: '722.247.931.582' },
         { visited_page: '/index', user_id: '336.284.013.698' },
         { visited_page: '/about', user_id: '682.704.613.213' },
         { visited_page: '/index', user_id: '336.284.013.698' },
         { visited_page: '/index', user_id: '444.701.448.104' },
         { visited_page: '/about/2', user_id: '061.945.150.735' },
         { visited_page: '/help_page/1', user_id: '336.284.013.698' },
         { visited_page: '/about', user_id: '451.106.204.921' },
         { visited_page: '/help_page/1', user_id: '646.865.545.408' },
         { visited_page: '/help_page/1', user_id: '715.156.286.412' },
         { visited_page: '/help_page/1', user_id: '126.318.035.038' },
         { visited_page: '/home', user_id: '217.511.476.080' },
         { visited_page: '/help_page/1', user_id: '543.910.244.929' },
         { visited_page: '/about', user_id: '722.247.931.582' },
         { visited_page: '/about', user_id: '336.284.013.698' },
         { visited_page: '/index', user_id: '451.106.204.921' },
         { visited_page: '/contact', user_id: '802.683.925.780' },
         { visited_page: '/help_page/1', user_id: '802.683.925.780' },
         { visited_page: '/about', user_id: '336.284.013.698' },
         { visited_page: '/contact', user_id: '158.577.775.616' },
         { visited_page: '/contact', user_id: '126.318.035.038' },
         { visited_page: '/about', user_id: '802.683.925.780' },
         { visited_page: '/about/2', user_id: '543.910.244.929' },
         { visited_page: '/help_page/1', user_id: '200.017.277.774' },
         { visited_page: '/home', user_id: '126.318.035.038' },
         { visited_page: '/about/2', user_id: '184.123.665.067' },
         { visited_page: '/home', user_id: '451.106.204.921' },
         { visited_page: '/home', user_id: '200.017.277.774' },
         { visited_page: '/about/2', user_id: '200.017.277.774' },
         { visited_page: '/about', user_id: '543.910.244.929' }]
      end
      it 'parses the file correctly' do
        expect(subject.parse).to match_array(expected_result)
      end
    end
  end
end
