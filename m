Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL1bQ-0004cI-SA
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 07:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=870f666b0=Anup.Patel@wdc.com>)
 id 1mL1bO-0004Xt-Sx; Tue, 31 Aug 2021 07:06:50 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:13068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=870f666b0=Anup.Patel@wdc.com>)
 id 1mL1bL-0000xo-UO; Tue, 31 Aug 2021 07:06:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630408007; x=1661944007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9YWh0cd7WYdhHraCcovyltKu/6eG1FEBg2z6TjzRYtg=;
 b=GkXUzPmaeNnL1zS5H8qJuzk1u2WLV0rJshPkbm/6OQvwvhrUS45aVYuC
 CG3daFjKHDJYHXdOfgx0KnUQu9MGhwpIWmxeEp3aA6NqlO1sNlnjjcjNj
 ScHuHp/euCQG+3dGtvnRp60Mt5sm+0gfzjRpve9b0FsXKhwEe6cafwNYI
 qAGsDF4FRkT9ZBPEUOzwFgFPiGG6q+uwt0SnsfkmTH8CxBg/Q+1pv/rMM
 JsIvLuAN+wq695ExnmD/sXuFKQRMDQQ5vIC4ShETFEbWSmlqqGPY/IqPT
 rvQw41Sv3EEzvj9GLHwKbgZjASJPebjiEs50/8YTs18aa0kZ1DqTzfg1g w==;
X-IronPort-AV: E=Sophos;i="5.84,366,1620662400"; d="scan'208";a="177951717"
Received: from mail-dm6nam08lp2041.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
 by ob1.hgst.iphmx.com with ESMTP; 31 Aug 2021 19:06:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCoJ7/83KP+Vf/A1fygZRXrdfxIN2oFmGH9ORFPtSxcPmyHGJTW8N5Emf7dyAiX29zdSwoDqYNnBK8XfFhMMc8LgFE3ljY09IQQxA7HdttxL4DhuMMim/DjbHCPBp8RfWnxMqN3KP54rz+JixOUHjQyb1WRBAsh4E2EGbI3gcjYorsqJe9SynLzZj9AiyS6U22Ry7vQkwCbuY6B4FLPxShsNjxSUKFppaUTJb3vU3G4iIyJFi/+6oyf0apsLjLjDVXeltHfxLHIxUajDEbYHE+6JBZ4kNDc5v3BPpDPw71oaItr0SakHvh9MzOgXQWboEL69rFb505XpGh36HKEBmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STz91lNhvGBvf1hIXeAIKKX/tfYS3xzcf9uFPBjXujo=;
 b=n86ftkN5xnoYfvGBjY2bWU1psT92sc4PH0xLk0ydeqtDOjS/JhACh26P8hC2YZOt/uQ7eIerpCvVnrmaP9TwQ23Mnw6h9lkO5NhbtqqKyybEImAsWOJXocldhTXUKjKJI3izRRd3wcyK+fGYmjfkeC460Yv1WLs7f4wS4diDfk5ZxAHr3/25l9D9v7cgPtggEX5358d0fSvHkpZ0CmU7tXFzly7zXqRYEXbSt55V+GNscdNsg7ZM+5KCpWj5ls+dm1/lonzcQDE34doxfiBpYR2ZhbOPWHhNBc6G4dMoXWSc9dFMrQbe7YUxZpfTYHEAGn0Lx2GC2JlF/wtI8FOnpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STz91lNhvGBvf1hIXeAIKKX/tfYS3xzcf9uFPBjXujo=;
 b=cq/x7YL7Urgcs/Mbbr2CCuNU+t9gPH7Z0Z5rynWOJHA+OS/dTEDXF5AewCTmVRBbaqqSaURr/N+aDWh/nLmjleifNtmUmcwuaVXufEWOwIIwFPTYB8IomUOEqhag4npKhUSAkZu5KApbRqHMvSjM923kJEQBMOD8Q0ErmaKzG00=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from SJ0PR04MB7821.namprd04.prod.outlook.com (2603:10b6:a03:3ac::8)
 by SJ0PR04MB7886.namprd04.prod.outlook.com (2603:10b6:a03:300::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 11:06:42 +0000
Received: from SJ0PR04MB7821.namprd04.prod.outlook.com
 ([fe80::545a:34f7:53c5:6514]) by SJ0PR04MB7821.namprd04.prod.outlook.com
 ([fe80::545a:34f7:53c5:6514%8]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 11:06:42 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v4 1/4] hw/intc: Rename sifive_clint sources to riscv_aclint
 sources
Date: Tue, 31 Aug 2021 16:36:00 +0530
Message-Id: <20210831110603.338681-2-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831110603.338681-1-anup.patel@wdc.com>
References: <20210831110603.338681-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::29) To SJ0PR04MB7821.namprd04.prod.outlook.com
 (2603:10b6:a03:3ac::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.171.35.197) by
 MAXPR01CA0111.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Tue, 31 Aug 2021 11:06:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 723daa80-3b52-485f-d343-08d96c6f6a07
X-MS-TrafficTypeDiagnostic: SJ0PR04MB7886:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR04MB78860F4B55C9253A6E75E5B88DCC9@SJ0PR04MB7886.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:23;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qsK1PiQgnjtLHKAu4eJZR/NU9gZh4cJNjcVI7+Gvtb+6XK4+evikHtgec78hij4oH131ruZGDojG0VA0arkI1I59ZxnoizvxiqmotPZYqy32n+v+fxK4apyEUY+K1mKmDm8+91RHXV1hxucYzYgDWlTSaiOEOZ40Sg7Ln9xTMMMNz94fnYen1l2fqY3+eaS1nB5I+EaW0lb6vdAsgSD/nGByafn/CmKIH3udJO43TdXegbsWi3mIXgO+o6r7zls+2k1nZz60A16KoSnvW8KtwBdIzd9IJh3Y0vEqvQT/eIFkkLesNgIjzN6GiRcv0orWxmq5YGv5qaWVeCYdCOkEOhmqkjvb6ZamMePQ/WFFTUcQ6P2EmuHXZGZxq36u5p4wMpANVyGdHNn5gqWtnBtgmG4nC0hI+3jIc9CHMbCB7NuvABudrMegW5aTV8aDsIsWfa+MMHMzujPiqjhKsefacXZ5nLrWP+qa83qNT3Nep8dplFdPT/KaGJi1vrVibJrPEinKSxfzJbovXa7p1MfK8fGj280jKtfy35afT/2e5PCrIT0lOSnCu7oFgayMhuMJteblgVO7IeCl8BJqcO4pdBKJ0y06dCEcW9chP0ASiWoRBwmA79mjDnY0KypZru/M/JJLX/Ez+LuxudwBJfIbB5ZTMZpnwYIhPXWap27+P21FalvHxOIwAJqk9djbHojn8RYAgnTSUqM7eeUaJl7ofA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB7821.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(38350700002)(86362001)(2616005)(7696005)(38100700002)(44832011)(2906002)(26005)(8936002)(956004)(66556008)(8676002)(55016002)(54906003)(5660300002)(8886007)(66476007)(83380400001)(316002)(66946007)(186003)(36756003)(110136005)(478600001)(1076003)(52116002)(4326008)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GQETrVNcbqgHsDx4d37s7/r6npyU7sdNRx9eVV1uXW9wm+CBzDnJC3D1q1x/?=
 =?us-ascii?Q?dfCOmNj3+ISZha8HTr7ZYS/+dfYaejE1B/KbhQcZcZ7F3tOCu0fzPoPPAmNJ?=
 =?us-ascii?Q?gJjaRY3wQaTYDJpkr/Mt4ilb+cOK/hvqkjm+CwYm3G8oVmi6VZUZO9R+Onww?=
 =?us-ascii?Q?TDcXn7VcvmWBk6Y1AX0hf6lBKmcWSq51opUCsNH8BuIjZG9ewPhJKpxTa1hr?=
 =?us-ascii?Q?B966JjyDVwR8MaGGvQSCNQBLxvGZetFxoi6+xvDMko8fd4YWYBGNrGaCkSI5?=
 =?us-ascii?Q?FnY+jdY/jfSO1WpGdz3RJDo6FgR5BWZVCz7f0zdCh9aeh9jdqpDw45DQVtJ4?=
 =?us-ascii?Q?oYJBmlsGvN7YHFgLH3HutwULVR8YHAdRrHvoIdU9nobaOj6Y1K02fakZjLE1?=
 =?us-ascii?Q?cOJyx3HrGrk88UE03susFYidmDzU3VSay9YUIbnS4/JS/GLjzfcL7dLvu2h3?=
 =?us-ascii?Q?qiisnVbOpPEz8C7h4K0XFaGtX9vyrHTzYabTEUDxK6K5Hvfn1z0Yvbx81V17?=
 =?us-ascii?Q?wk2EwEblkvMQGG7YbpwMfTKXEmTZhp+rSnB1iXQOdFvXE55mvLg6eBaFUiAb?=
 =?us-ascii?Q?oTIGms7ihNWNDjeGYNAQhEeXTeaWnKUtcYFifTsn+7le4qynx9TFkQtH8T0P?=
 =?us-ascii?Q?zdu9gmahQD+ifm5yl4seZEuHj244boKi7rziBNAxnnDJLDlctVIJQbZ+WhXG?=
 =?us-ascii?Q?yvQpgCOqtj9XSBD/9TYCIQC5k39AXXCx1DmNHufkR42dN0998dp/KSHWdm63?=
 =?us-ascii?Q?hdpyZBSS95JX0SWjlquo0ux1jGWB6XkPSqKxDpZoKL3T3qGQ8/GVZBvx2LNz?=
 =?us-ascii?Q?wHx28Glf71XNbZSWNfH95CWvgFL9G8LoGCiUmIZk+fJ7BfDJt7o1IvpQO1Yn?=
 =?us-ascii?Q?TT+Jzathbi60EqlTaPx82+s0JRlXHntNyv7JMrXPpmd/5k6Uibm7V4BZzKu4?=
 =?us-ascii?Q?W0zdDi64/JwGV7AifuJXdBFiKd95zRpRwM6i5EdWdsyu7+Y7hkeQOO5I6PnV?=
 =?us-ascii?Q?F3vnUl9Y1oYNhiLIlAUmc3gWz187Oa7W6tXDAC9yHJG75xQydjFnUs/bcYE9?=
 =?us-ascii?Q?BZYc4aXUFu9l05Qqq09UYJw5uhnGbJVCDYVGqJhu+hJAon0c8b+MgQ7FICMH?=
 =?us-ascii?Q?nQqNqq5SkKp1dNopPoqMxNH/OY24UJpKY+zUobFa32ciRBhgBMENEalU6K2B?=
 =?us-ascii?Q?/j2K4fQOa+kReutRxPiScfM5YskUivppHOiZ2KYZzthTp4STW4nkv58aKpFW?=
 =?us-ascii?Q?Wb9EsY+Y4qrq622s/qdfJ04Cw4hY1y1CX4Wr/6heqJ8zJ82LFEmiBovdHoh6?=
 =?us-ascii?Q?WExzv1dKDAg8Fd/JW+BpA0Iy?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 723daa80-3b52-485f-d343-08d96c6f6a07
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB7821.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 11:06:42.7017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCzLjvKIB+9AWAl5pHbvd9nhCxDBdsyBPe4aBXCkgWohqdLqMA1wsLOR8dvFeyiRVpEkDJtCNEz0FWu5UC9iXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7886
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=870f666b0=Anup.Patel@wdc.com; helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 31 Aug 2021 11:06:51 -0000

We will be upgrading SiFive CLINT implementation into RISC-V ACLINT
implementation so let's first rename the sources.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/intc/Kconfig                                    |  2 +-
 hw/intc/meson.build                                |  2 +-
 hw/intc/{sifive_clint.c => riscv_aclint.c}         |  2 +-
 hw/riscv/Kconfig                                   | 12 ++++++------
 hw/riscv/microchip_pfsoc.c                         |  2 +-
 hw/riscv/shakti_c.c                                |  2 +-
 hw/riscv/sifive_e.c                                |  2 +-
 hw/riscv/sifive_u.c                                |  2 +-
 hw/riscv/spike.c                                   |  2 +-
 hw/riscv/virt.c                                    |  2 +-
 include/hw/intc/{sifive_clint.h => riscv_aclint.h} |  0
 11 files changed, 15 insertions(+), 15 deletions(-)
 rename hw/intc/{sifive_clint.c => riscv_aclint.c} (99%)
 rename include/hw/intc/{sifive_clint.h => riscv_aclint.h} (100%)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index f4694088a4..78aed93c45 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -62,7 +62,7 @@ config RX_ICU
 config LOONGSON_LIOINTC
     bool
 
-config SIFIVE_CLINT
+config RISCV_ACLINT
     bool
 
 config SIFIVE_PLIC
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 6e52a166e3..9c9338a9e4 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -46,7 +46,7 @@ specific_ss.add(when: 'CONFIG_RX_ICU', if_true: files('rx_icu.c'))
 specific_ss.add(when: 'CONFIG_S390_FLIC', if_true: files('s390_flic.c'))
 specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true: files('s390_flic_kvm.c'))
 specific_ss.add(when: 'CONFIG_SH_INTC', if_true: files('sh_intc.c'))
-specific_ss.add(when: 'CONFIG_SIFIVE_CLINT', if_true: files('sifive_clint.c'))
+specific_ss.add(when: 'CONFIG_RISCV_ACLINT', if_true: files('riscv_aclint.c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.c'))
 specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
 specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
diff --git a/hw/intc/sifive_clint.c b/hw/intc/riscv_aclint.c
similarity index 99%
rename from hw/intc/sifive_clint.c
rename to hw/intc/riscv_aclint.c
index ab172d8e40..31ce990d0e 100644
--- a/hw/intc/sifive_clint.c
+++ b/hw/intc/riscv_aclint.c
@@ -26,7 +26,7 @@
 #include "hw/sysbus.h"
 #include "target/riscv/cpu.h"
 #include "hw/qdev-properties.h"
-#include "hw/intc/sifive_clint.h"
+#include "hw/intc/riscv_aclint.h"
 #include "qemu/timer.h"
 #include "hw/irq.h"
 
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index ff75add6f3..f065e32dea 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -12,7 +12,7 @@ config MICROCHIP_PFSOC
     select MCHP_PFSOC_MMUART
     select MCHP_PFSOC_SYSREG
     select MSI_NONBROKEN
-    select SIFIVE_CLINT
+    select RISCV_ACLINT
     select SIFIVE_PDMA
     select SIFIVE_PLIC
     select UNIMP
@@ -26,7 +26,7 @@ config SHAKTI_C
     bool
     select UNIMP
     select SHAKTI_UART
-    select SIFIVE_CLINT
+    select RISCV_ACLINT
     select SIFIVE_PLIC
 
 config RISCV_VIRT
@@ -41,7 +41,7 @@ config RISCV_VIRT
     select PCI_EXPRESS_GENERIC_BRIDGE
     select PFLASH_CFI01
     select SERIAL
-    select SIFIVE_CLINT
+    select RISCV_ACLINT
     select SIFIVE_PLIC
     select SIFIVE_TEST
     select VIRTIO_MMIO
@@ -50,7 +50,7 @@ config RISCV_VIRT
 config SIFIVE_E
     bool
     select MSI_NONBROKEN
-    select SIFIVE_CLINT
+    select RISCV_ACLINT
     select SIFIVE_GPIO
     select SIFIVE_PLIC
     select SIFIVE_UART
@@ -61,7 +61,7 @@ config SIFIVE_U
     bool
     select CADENCE
     select MSI_NONBROKEN
-    select SIFIVE_CLINT
+    select RISCV_ACLINT
     select SIFIVE_GPIO
     select SIFIVE_PDMA
     select SIFIVE_PLIC
@@ -78,5 +78,5 @@ config SPIKE
     select RISCV_NUMA
     select HTIF
     select MSI_NONBROKEN
-    select SIFIVE_CLINT
+    select RISCV_ACLINT
     select SIFIVE_PLIC
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index eef55f69fd..eed9e81355 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -49,7 +49,7 @@
 #include "hw/riscv/boot.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/microchip_pfsoc.h"
-#include "hw/intc/sifive_clint.h"
+#include "hw/intc/riscv_aclint.h"
 #include "hw/intc/sifive_plic.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 09d4e1433e..f9f0a45651 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -21,7 +21,7 @@
 #include "hw/riscv/shakti_c.h"
 #include "qapi/error.h"
 #include "hw/intc/sifive_plic.h"
-#include "hw/intc/sifive_clint.h"
+#include "hw/intc/riscv_aclint.h"
 #include "sysemu/sysemu.h"
 #include "hw/qdev-properties.h"
 #include "exec/address-spaces.h"
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 04265c5640..a73848958e 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -41,7 +41,7 @@
 #include "hw/riscv/sifive_e.h"
 #include "hw/riscv/boot.h"
 #include "hw/char/sifive_uart.h"
-#include "hw/intc/sifive_clint.h"
+#include "hw/intc/riscv_aclint.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_e_prci.h"
 #include "chardev/char.h"
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 6766edc1d0..5a7c202dad 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -51,7 +51,7 @@
 #include "hw/riscv/sifive_u.h"
 #include "hw/riscv/boot.h"
 #include "hw/char/sifive_uart.h"
-#include "hw/intc/sifive_clint.h"
+#include "hw/intc/riscv_aclint.h"
 #include "hw/intc/sifive_plic.h"
 #include "chardev/char.h"
 #include "net/eth.h"
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index aae36f2cb4..690c19c12a 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -35,7 +35,7 @@
 #include "hw/riscv/boot.h"
 #include "hw/riscv/numa.h"
 #include "hw/char/riscv_htif.h"
-#include "hw/intc/sifive_clint.h"
+#include "hw/intc/riscv_aclint.h"
 #include "chardev/char.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 47f1beb473..df33fd74c2 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -32,7 +32,7 @@
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
 #include "hw/riscv/numa.h"
-#include "hw/intc/sifive_clint.h"
+#include "hw/intc/riscv_aclint.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_test.h"
 #include "chardev/char.h"
diff --git a/include/hw/intc/sifive_clint.h b/include/hw/intc/riscv_aclint.h
similarity index 100%
rename from include/hw/intc/sifive_clint.h
rename to include/hw/intc/riscv_aclint.h
-- 
2.25.1


