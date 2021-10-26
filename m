Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGBF-0003HD-RI
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGB5-00037r-0V; Tue, 26 Oct 2021 02:43:19 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:17108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGAw-0008KZ-Cx; Tue, 26 Oct 2021 02:43:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635230589; x=1666766589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=z3qIOXYfVWykrEEtE+DZx9v+O2iQ78PhkBTRuSZjnU8=;
 b=hQB9bYLYTtwVHNs5mZ1iGc36yZcbfXJBlqHI41bF8O4nstwTj7E12YaO
 LAP4DCo7NPPiAfS9ToaSN430+1Yznh6rf23cjQWHHmbSniQXRRFY0W7Q+
 D9BJ7dmSq4uVCjkkJOPvp5FL4duFDDv6MRUuf/RcoEBO6fY+ibdWxSrod
 nUBK+a2CFVkUSFkcuUXJ9HLsdp/l6HmdsPIsQq5BbWwHGlPav252T4N2n
 mK2bWwfoIaAKW0DKoa3oQ2sp10WDIBEQMLafdasMZNaQX/MhmYHGruHlj
 ocqkn9/OLUMqY0d6v8+JAO4skc6qji9AQ8NatTgI9v6Z+31MUiiAv3PE8 A==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="188620397"
Received: from mail-dm6nam08lp2043.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.43])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 14:43:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4L+PLQQXWU8PZYCGo9DsSU+npEapysINuxjjAAX0DuhIDKKTM2LME1zFMWg4nEB/+Pg6fVowTkP/LDZC7GGBNRSzmYRpFbRzd55EHd+xBUgXtLFxZyRyOpaIYF9uZe+Yk3OetDIsyq0SkR5FcZZj4LU7ZVV7o5/Tf8620XPb4mlKkw9Owgn867zAuqKEF2a+IpsHzvE3aqQV4sErJKkUbGPpLp65eJZAiwvd8QXSy5Fy/ok5YdjraXWkhqRFzSNKEhz0igN0nM5Rzct1mBqEY6I7XBwzE5i+KRwbAVpaX06878B90a3WeRhRIBcjQ6qv6rPMbOizoFz/viMa8nXJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dL1YDusRsyUzrz9kwwbmLXyN21mUnwX+DADOnb91Df4=;
 b=OZx9q3p6thOvjLtkZ0faiclyo7lXHRgKik4U/00/QgPLEIjd1XWF742CA2nwYHl33DSPKBZieQqWv0ToErT4CzUxW/ISrBNwX9DrMR9+426hDJ8I0jWMdrwdEkDkVUUgd844g9rnWcMTl698BSVpCrEOgdJzm8VyXo3aA1H2BXt2Os/DMtW08NY+1h4rxGAl9Ud03x+hjKhnxmY/Ni4yp6iyp7mNGHAn8RrMM5Leqf8f8c9PNvQbNGCn3SYOsqqplGnPoh8g6UIEtXyzCvaDw37EpLtEltJ245w96h0XMUT4Id/xzAgELeKw3054Vl5TWGhO+qF6OwTYRqXUxdjJaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dL1YDusRsyUzrz9kwwbmLXyN21mUnwX+DADOnb91Df4=;
 b=jyJmDV6xdw35S7txvd5IGiwrGxhqPUhA9sJnjXI23j0MYebEca3k1MzSO2aw+UTag2vLvbFLaJJry1raUY2HrYtMx4deLXMj3gJeL2o2mdeoveGYigMHBLNZEnW7/9KIKwqa1ipzA7jeo3Y2qp5NYmRuVMZvdoEz8kjWzx8XHz8=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8394.namprd04.prod.outlook.com (2603:10b6:303:141::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Tue, 26 Oct
 2021 06:43:07 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.022; Tue, 26 Oct 2021
 06:43:07 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v4 04/22] target/riscv: Improve delivery of guest external
 interrupts
Date: Tue, 26 Oct 2021 12:12:09 +0530
Message-Id: <20211026064227.2014502-5-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026064227.2014502-1-anup.patel@wdc.com>
References: <20211026064227.2014502-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::31) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.162.126.221) by
 MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 06:43:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 257f4ff9-494c-42e0-d864-08d9984bde93
X-MS-TrafficTypeDiagnostic: CO6PR04MB8394:
X-Microsoft-Antispam-PRVS: <CO6PR04MB8394A5093AA429E793007A378D849@CO6PR04MB8394.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /bmiSBX9nihlgR4Ob3lcS7Qya0qz8Daztb55snRMMxaVlgehQU94XJeEu2wULhXSguRK8tyO9olRZNVBPqeat3PR/+XKfZsEP7mQHeoT0kNk26LgRm4MKsWVwMufBcfUJy98k/rxCA0P/ftewMmKB4axEop0IolFtWHbFlZbFjG9BbFA1GZJdmxDIO5cwrKR99sLbYYN4cddxqV9BZNT8b5bM6nXfoFWLd/VzsKlTy3eFL4RWV99YBBT0xHjGYvcCjnxo6sGH1O7LVLTuklApLiTL4XlXSaIGjOqlRhO0lKxot5f3v6xEw3iiJxgkbFoHzVV9uEtXP6NRbaS8u9E9wDOpPJTd/NuLZz4xqJX5CaJwuGfBeYZgI2f+wSDw2o/whW3cnC8yRHvIMcyA2Bmm5ZJNiIBTFHE/ldr8H7hIL8RIW7/3xVTnj1gtuQ3yU3jrhiuKe5brlShHn1s9dHDexqH/RJO6Do+GGWFnJt5QGnWV8O6ic57qkNAxUKVnYTkJrvLxkW9Z3XO1lOJFkSo41jYLCS8a3Lqq/8TdrT0Y/hyv0QK9MRshuXsAw12djQdp/2ynm7VuFqOFmMlvTvcdRSBLrI/TRNdXJMfXWn1N7sZeU0zjYDGQBgrUQR4pxyjQQNOtiTolDdEcERaf+CmaMwkPahKN3fCQKU1ghjTWGsuLSthwObfy3/7hADbLrDIevzdNNQg/xCQvR/Q4VV26Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(956004)(83380400001)(8886007)(508600001)(8936002)(44832011)(82960400001)(8676002)(5660300002)(55016002)(186003)(26005)(36756003)(1076003)(38350700002)(66556008)(38100700002)(66476007)(66946007)(316002)(52116002)(7696005)(4326008)(86362001)(54906003)(2906002)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GS4GjMVjKViE50/l2y5CdHEsxUdgk3RnIeP8GaadQbbMmcRIMR1lqdUYaJ+T?=
 =?us-ascii?Q?Qkr3/3UErCXSTo1y9rEZisvo2M+gTthpG2/+5+nvWQDD0Wo0LIexV9Ol21n2?=
 =?us-ascii?Q?kh74zxHqkUwz9G4YsB+u0IZ+8fIKCQAEpMoLSZoTh+lxlssfemzXmK8QMU+0?=
 =?us-ascii?Q?FjPWySLgpAFL3HWCek69I4+s5vn+CFxGakIknLqATu+DZaOj8l1GXRYiJrKf?=
 =?us-ascii?Q?BOKsD7ab2Zf85A6O3Nzf0MwlbUs9iOAXCJsx7JTIldVHZShfAILszeBybToU?=
 =?us-ascii?Q?Rl3yR3g8HgFhybBwzPumaYEq1cyBcn4CSmltURupO5Dbq02XqN59YhEj1BAx?=
 =?us-ascii?Q?zb7r5yIgsjlXATlkAzLaN22juTJN9xs1/SpBDVkZXA2UJajy7t5EJ5j9yYG4?=
 =?us-ascii?Q?UCTeMtoq8F3P3YuauKEcaxVCuwBkpUDeyVTzEhGzawIwBhmFBqRh3Xqc9yZe?=
 =?us-ascii?Q?ufv5fUzZZSp8eHkGSFhXizsdFjtDnmf5A0dGpjZ4H9hu7A/Fdt6MWYOxu4sc?=
 =?us-ascii?Q?jO9xy8JTL1Ndxr3UI4HVF4RDRs1S+YeRAC4CMSSu/SUiX5rPmjbL+67lW9LH?=
 =?us-ascii?Q?wkkynbBI+7SZZWZoAbWnSHbcVfXrTsXLXvRG6hbkXTrUgxMnfPwNnGaQKspV?=
 =?us-ascii?Q?KtmiOMXr1nkDWu8DimHpHO0n9KvBhFn7bi/f/WpvyMPf4znq6ZOmoZZ1l5qP?=
 =?us-ascii?Q?ys+jLC0b47CgcngM0ZgRUASJ1CtcyMYHCZVqQ7+gKO4K2+4E206vDEInnZTD?=
 =?us-ascii?Q?+8whbx/L56bZiMyAO5l2KEsffST9zZYr3z6vAIcF/hu0RrtPEFGaHd3+Kng2?=
 =?us-ascii?Q?N3Jz6K0G3XuTOKGpT5sPXfVCrhhlA3Sl3OptlHeC5WUD1HGIYO/cY2Sp9rKV?=
 =?us-ascii?Q?6d0pDoRVwOb8W0seRroiqPcyBJqi9+lKPp94Pt+C6/RuDCQ7lTcLg6tVp7sR?=
 =?us-ascii?Q?og2IN/tr25u/+2jYQ/CQ2I1ZikQfz9FnyoJcvBcHnK7U0dQoLKHP+Da1nyTr?=
 =?us-ascii?Q?J/xvoJ3uWftonDjMWpW+HrtF8LWQv6m4v9ErHe6gDQjCQD4i5x48ujjVOmSq?=
 =?us-ascii?Q?RTRocB8Zp3ubX6Pprf+C7tZ/ewMexyC/DMFvDsyzn2V0RRDeuuaU7/HAlkAL?=
 =?us-ascii?Q?wsUchmmvlDly/lczv8SeDVitsphKwFCsGW4M1nNY3SMj+Kb5RHYkZWxl7dsa?=
 =?us-ascii?Q?G78awBeFB7xTotZPOxJmJcAmatEfMtPtwgASf2J+yPeQDykSgdeVp+txxTNg?=
 =?us-ascii?Q?fmVBuZ/hMuWm3RGBwjl2Q8P7+ib9V2ARgM9rXjWSIpoRFCzspzHpC0G96FHp?=
 =?us-ascii?Q?BIrxsxhZttbqAME43ec20DYi20SwJfwYQY69ITsNPwUBV/w3ahVkRQt0IPBy?=
 =?us-ascii?Q?cHcIvyFUNV8YP79eFUl3X9HyOHI8t3/649265zX9bjGeZVnju2czqhjM7pLy?=
 =?us-ascii?Q?2/2XpW8Ume4DHfkt7jIywqbNvelQmnzkNoD8qX6h11z9QD8ABncejE+bifRu?=
 =?us-ascii?Q?1XS06aL5sZSR61y3yKZNNhsCc+rxJXUFJAvOwEqza9Q8d3wtcFCduaPU1jN0?=
 =?us-ascii?Q?DM7UKUUZd6JzS2mHtrM0wC/e2F1XTuDGvreM+JVK95ENh7BDgS8wR6uevrfl?=
 =?us-ascii?Q?udAa0o3PUvHh3nmtBsVZYY4=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 257f4ff9-494c-42e0-d864-08d9984bde93
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 06:43:07.4811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUYuBJH+JLVF7Wq2xXUJUC64OyMiOAMd9XNZjisikW2ueNGuEZ8a7I9K4ICEnvy/pqgLeWDMC+KK8z+Hu5J44w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8394
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=9269cd5e3=Anup.Patel@wdc.com; helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Oct 2021 06:43:19 -0000

The guest external interrupts from an interrupt controller are
delivered only when the Guest/VM is running (i.e. V=1). This means
any guest external interrupt which is triggered while the Guest/VM
is not running (i.e. V=0) will be missed on QEMU resulting in Guest
with sluggish response to serial console input and other I/O events.

To solve this, we check and inject interrupt after setting V=1.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu_helper.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index bb7ac9890b..04df3792a8 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -287,6 +287,19 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
     }
 
     env->virt = set_field(env->virt, VIRT_ONOFF, enable);
+
+    if (enable) {
+       /*
+        * The guest external interrupts from an interrupt controller are
+        * delivered only when the Guest/VM is running (i.e. V=1). This means
+        * any guest external interrupt which is triggered while the Guest/VM
+        * is not running (i.e. V=0) will be missed on QEMU resulting in guest
+        * with sluggish response to serial console input and other I/O events.
+        *
+        * To solve this, we check and inject interrupt after setting V=1.
+        */
+        riscv_cpu_update_mip(env_archcpu(env), 0, 0);
+    }
 }
 
 bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env)
-- 
2.25.1


