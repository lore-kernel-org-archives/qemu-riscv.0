Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nrJrH-00075N-MQ
	for mharc-qemu-riscv@gnu.org; Wed, 18 May 2022 09:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>)
 id 1nrJ5I-0007x8-5E; Wed, 18 May 2022 08:47:28 -0400
Received: from mail-os0jpn01on2071c.outbound.protection.outlook.com
 ([2a01:111:f403:700c::71c]:19332
 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>)
 id 1nrJ5E-0002uo-2F; Wed, 18 May 2022 08:47:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4Hi3K3H6uY+U8e9rpFP1CL0/xbAhLsqEhB6PVdjxov2spEzPiCFK3LFC7ti60tQVgdX64SEiHAorRrHzjxir7stNipyqbKknxwtm7DG+9TkFQcF3baAGb6gSONbV0TuAns000QhSBBLEGUnzvqotgefwZe0OACCK20gHytOE9be+y48C1Baz9BtbFOyY/icW/sJySUAAbHu6YxlYrXuuK3YzyU2O3BIgOmgdZUGcpIjbL065tEQj/s0YrmegWLPY8w7YNhNcPcpHJOen6BQpLu+O0kr3wda/Qfuf56/awws/rIklXbbEPmeTsNLaD+j2Zj5OH4WIeDlc6JB6bPwBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmvP0L7KLET9m7zpSqlt6OgUlP3Yuy2DbY9ydbkYC2o=;
 b=D70I2YEFm7+U/grKcwa/c6oT0a9mzi52JjB0O8DrBP/3sBrcu4oes7WvebROskV7ie/lDl0N9LFyeEkBHIr3J9vLi+2hY1NT4PFlIr8tXXPBQElv2oYsAByQKwfR+7eqM8JTfRFn525Cs0kV/U3JwuSUDMPf0j1i3epivgTN8xtbYjydjYVbjomi8aD2dFcULcIZsIgC9nuTPEX7EUF4AXN57KKd8A3MoEN7cUt++0mAqwKPiipFgeym0sRHM3EUmtws6ZXJppt8tIz+NJNviBLUoU50JjmW7FhsQoCb9KrxNzPCxz0RhJ2TaVOQUnWvJDcnLlZVX4HzADMjDdSVpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmvP0L7KLET9m7zpSqlt6OgUlP3Yuy2DbY9ydbkYC2o=;
 b=jEiU0qOg46nn0E5M4q3Z/p07hE7Zof04UMB3QMbxQ+hh73khQJRZA1UWLVhrepgAJKTroO1wp9rFLUDzTWaUD4JenFDsm8RDO3tVmWjYBQQ5ErNnOnhbvq2tsfqa0hXSmgDoStrKpUyiAs8oTkwevDjYK3x4dh2BwvOYPRZnOBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OSZP286MB0822.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:ed::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13; Wed, 18 May 2022 12:47:06 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::bd99:5c83:e2dc:a8f7]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::bd99:5c83:e2dc:a8f7%7]) with mapi id 15.20.5273.015; Wed, 18 May 2022
 12:47:06 +0000
Date: Wed, 18 May 2022 20:46:58 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH] target/riscv: add zicsr/zifencei to isa_string
Message-ID: <YoTqwpfrodveJ7CR@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Operating-System: Linux Sun 5.15.26
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: SJ0PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::25) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69467da8-09ff-400a-34dc-08da38cc83ca
X-MS-TrafficTypeDiagnostic: OSZP286MB0822:EE_
X-Microsoft-Antispam-PRVS: <OSZP286MB08228EEB6BE8E405DC04AF58BCD19@OSZP286MB0822.JPNP286.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZMAdzfvwb+Jonn5sNtixpBuxv2OzoixHLWuhVX76qVgIXh7CQ846DugLxZ/SuCwta4aRuzkITOA3rMu1ylwWj52XzayOGZdmBT38uNz+nWmYOyIKClU1S4CDuulRUKwU/Qd++cm37f5V2g9Wv8sHGQQVR19mf3YeRZKdyrNk2G6xc1ZS0bJLGxZ4eayUJt98Kv0YOr4iJytPWO+jevlRbCkksxM2QySzYJ21ELbI5Y3Es6nH/ydAZ4mg3541CC+SOG/QxnrgmUPfrH1lmWueRppw7CvUKMdYpFk9ieOWooiwXXZ4G1SEmBTS+0Yekov+Snq61jJ1Ms71aVw2jvDn9hcCFSKHRmmT3tJT+kA0W2WB8ONoBc2H2vsZ9JjQJlCV6u1kY1gN13Dq3xBV9yS5iUYLiGBXRh5IwLTj8DAonvNqdWMRVb6UbIc8YBRyiCVhinpw6CrJNqa4w8cr2yGVxsIdHJYUjbBShkN5xHOAK7mhN/iuPZwyat1Wkv1z8D3nW87lPukymBvcY5KBggYLJOY14SeoPF/sgYkBDy9OXNhyIjfafUGMNQxj62Rv8yi8G+tGig7Wo0dJ80Cr+JFlh57gQSewTFB8FySgF1nd9AvS9IfddcKom7quH4HZrojiPlv7NF7NtvwWq4tkX1evwLNMlCBNFl+xMH/f8+0nobpZ3dMtncZ0Plc3NXuUGizVt5HMv6+L8kL6OeC1gy+dGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(396003)(346002)(136003)(376002)(39830400003)(366004)(66946007)(110136005)(4326008)(86362001)(66556008)(2906002)(4744005)(33716001)(38100700002)(6506007)(5660300002)(316002)(41300700001)(6512007)(9686003)(66476007)(41320700001)(6666004)(186003)(52116002)(8936002)(508600001)(786003)(8676002)(6486002)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M76YxInzvmXBGg/druQlUSi3hQa9zAgmxe0QuZSOKO57h180H+aoteSaRbpn?=
 =?us-ascii?Q?Kyn4OP4sbOl91OxjapEbEdEGSfkN9eqZKSKaxuc4hAa/KRYEgJVrB/1N1vjX?=
 =?us-ascii?Q?Lzmgeb5ywHFveUhYbuTG4/fXJIClfcCfwO2OO7+XpyFVIUsjvx9Jj3CDpQ8D?=
 =?us-ascii?Q?QTJpfoxxxr894LVu+InsBNx7GeVaca0mL7SqLsvhU02dZg+WB847rBrvCtUX?=
 =?us-ascii?Q?8X2OCASxi0QLp5yj+AUJpCIOx2cY0KENRAob4IBx/IapHtso1aZ/M/JDxlIC?=
 =?us-ascii?Q?U4w4DwZsdoOZEIU6PuZANluJgAayWn3gHFCb1TtoAL4fL9qteqSBeqehpLxl?=
 =?us-ascii?Q?F3gQXJ2G1lm7/UGRGbcwWCc6H9/QOe4ZdsZ3iw2WIe9iv4Tc4KBDH/KsqU2Y?=
 =?us-ascii?Q?WSEzizkNo/esH+IZ6LR27UTx3ujMocmcQX+K2oUzrgJSF95eqtlNyZmMk3MK?=
 =?us-ascii?Q?/skBBxd1rfdT9hh+i46WoD+hOf+wRsGBch90MWeBZcx1ZcHDi2z7T1ZZ6VKR?=
 =?us-ascii?Q?8REj0PbRamjDPjo7cLXpECjqK1iW6fV14jvLZAGMeDSeuL03UpCYT/5Sz7EA?=
 =?us-ascii?Q?L49Fpa5XHSPvLzuxxB8C97iR7dnJoo/COm9CN0Wqz4ybuOIfsD+0q2mPPW9Z?=
 =?us-ascii?Q?LfS2UkqaR6vNK2bXTaAJYO6p6jdKltQ3c1YejGd3hNk4u1/+2j/VKgJVza0S?=
 =?us-ascii?Q?mHmUKnWFllplFAbydSM6ipUv1KMuEDqHNObnvc+M/dc2VcJcA271Clo0CY6H?=
 =?us-ascii?Q?m6QEfjOFoXR7rHaMlZBC3CE9iEBaB3RwJoAUaTsQKJmjZaYDh1516uIXNY6X?=
 =?us-ascii?Q?p91m8uP+BmU4CkCrEe9orygmiXf8DAapqYc2tv90dTGpYecbCXr4L1OHN+61?=
 =?us-ascii?Q?gRBH52uTFmnYlfdF/052tSxB6J3RaWWh29qcPiuvXYwKE/cjhKxANCWjo1mG?=
 =?us-ascii?Q?ZUI5qi1ZnOmEtX6k1xwiNwy2JR6m23dupi2hQRQMqd5eMK6NmNKGfpYXqA/M?=
 =?us-ascii?Q?JhtjEMBemJ9yIRfTdisIguvMF4QhBHaumlKAJAAzDe6poQT/LbCabp67VOuE?=
 =?us-ascii?Q?U0/EYiMrzGrw6rFw3xVb0c5VTJU7BsvrCpSKxAqJ8f8sIbKOtG44yumOkVMK?=
 =?us-ascii?Q?VDHHMDfAUWLZoi/FLFhjM9c3uyBzCMMC8X5ZIW2AlJnbOENpS/EhUmb68nez?=
 =?us-ascii?Q?EOMeJ49OxqBAeX/HlxBMzGImL4ipE55nifFw8g76lUX4VKF13jLGPFDRv3V8?=
 =?us-ascii?Q?z/pWsorjQiTCVHKcVsJsrbYcisiwzTKvRXQ2Cpm8lABFJyWLRF+orOFpqxI7?=
 =?us-ascii?Q?+eBcKtNtOOIdIVaUu2zQMHVq3j4pj/OhfjiXaERl4FLqbEBiPmdkE3oxO9uh?=
 =?us-ascii?Q?caJ1HX/kKFFUqSYGz9Z2fVjrAKBK052tzZo/RdIg+aGcsmOqWO86iHXxDdWt?=
 =?us-ascii?Q?Fg+XyAKTwebJUC3FwDOGKUwruv83UUf3bEAUbS/DKVUBc/a2cd9TbIMiXat3?=
 =?us-ascii?Q?IifpLzZQLJlqQHs6yLw2ndOxpxEpaQuH1/VpRq/mnI5cibDiAKYi+te5P71b?=
 =?us-ascii?Q?jlidiWF6YG+s69OHcA7AQpdkts1c0B0WDvfLkR0Wkg7QsPF0MotbRpTMgzaO?=
 =?us-ascii?Q?nLZpto2qxsmdl1MtjUVPXOVTz63eecGb+CIflMIfAhao9+diFuZAy084uvn8?=
 =?us-ascii?Q?UCpfjDmG/6vPXgmwzyo+A6cfPcOEZGpHV/adicUB1lc1JYqKziZyhA6Mp9Ix?=
 =?us-ascii?Q?YxYApHBLew=3D=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 69467da8-09ff-400a-34dc-08da38cc83ca
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 12:47:06.3460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNYo4s+lFireETQpJqLSzKJaInmKpl6eX+fG+cQih2OfvVE+x0stpHDSLCpp73KC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB0822
Received-SPF: pass client-ip=2a01:111:f403:700c::71c;
 envelope-from=i@zenithal.me;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 18 May 2022 09:36:58 -0400
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2022 12:47:39 -0000

Zicsr/Zifencei is not in 'I' since ISA version 20190608,
thus to fully express the capability of the CPU,
they should be exposed in isa_string.

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6d01569cad..61fa9b97a4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1027,6 +1027,8 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
      *    extensions by an underscore.
      */
     struct isa_ext_data isa_edata_arr[] = {
+        ISA_EDATA_ENTRY(zicsr, ext_icsr),
+        ISA_EDATA_ENTRY(zifencei, ext_ifencei),
         ISA_EDATA_ENTRY(zfh, ext_zfh),
         ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
         ISA_EDATA_ENTRY(zfinx, ext_zfinx),
-- 
2.35.1


