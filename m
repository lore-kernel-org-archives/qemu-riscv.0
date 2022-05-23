Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntBHZ-0005VX-5K
	for mharc-qemu-riscv@gnu.org; Mon, 23 May 2022 12:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>)
 id 1ntBHX-0005Uz-ND; Mon, 23 May 2022 12:51:47 -0400
Received: from mail-os0jpn01on20726.outbound.protection.outlook.com
 ([2a01:111:f403:700c::726]:7270
 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>)
 id 1ntBHU-0000eK-Fs; Mon, 23 May 2022 12:51:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CoQ3rO7DrsbHvTm/XleijO2cUq6VwNXm2d94wAM/nEi7lMQ9RAlsSlyDTdEjwN8CY9roZLYS4CnU01jie+nFgKWm6BnJyoalOvH69kJ/aCKEvJvjRGml/yBTsd5PnM4DYpvTm1EBP6EZ1NZQxULhcSJViATzACwJLR0ymtnDiXfwCSeZJqFLO/zssWI9LRmH7dzD22JtnnFmMlO+ZEj/smGF/2xc5F1ln+qj1TzDUbkJ+dbqrEIb1BqxyqkLUO5oNVgiDYtyE9h31OYFToB4w4xH6UHUR98tEPAa1ARkWRejl9mFRrf4FLUhY7sXOnUz5W2rHJZ6MiXGHliOhlWs0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvYhhcq80NWuvH2BvGcAttULf3EY1ROv3/Ag0qBklLo=;
 b=OTkhonEsPU7VqjuKdyUJBfSO/+yFEHO0h2TkJzhwtjLBVEg+Acu3FH25xIoYDDcN40YIAa3NJ9cVophmfMbnVE1faEi2UzvC+3HiLHhVEErS3RHYgnj74hFCu0WU/O7fmFdQqKZO5DdXXVJKCz+l72UpfAy4nuGwGSMFjR/wvMakWzMKIKwxyMWLktNaGlXSxN6D3rjRjdMaqkidVhh2ttw7WQSyPmlcXJyP7F20ygItuyMalLgeW8hEt2zLKBU+PPMGRdxYSpmNmkUGCNXOefPUZKqvHCCt8WsBwR2Re7WI+e2c8bCMhnDh7a4qaDeiDvgG8VUf1mCVjn6M56HYhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvYhhcq80NWuvH2BvGcAttULf3EY1ROv3/Ag0qBklLo=;
 b=h12AH1UjcEO/IdRlOlnx/fKmLj6elVJnkWDIdECCEJFZad7gUnhh7WbKYDp1hoHkPpAGwO2X0CmFAyEv94cNfqlt66Xd5PPNz9AUnAu7Q4nih9Fo5Vq93TpTszz3PIRboAfSYpav6EL6acOlEvQXyKJLW0KPaUMnLn9zkuIJBU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from OS3P286MB1400.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:128::10)
 by OS3P286MB1735.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1bd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Mon, 23 May
 2022 16:51:33 +0000
Received: from OS3P286MB1400.JPNP286.PROD.OUTLOOK.COM
 ([fe80::499a:6af2:bb66:601f]) by OS3P286MB1400.JPNP286.PROD.OUTLOOK.COM
 ([fe80::499a:6af2:bb66:601f%3]) with mapi id 15.20.5273.023; Mon, 23 May 2022
 16:51:33 +0000
Date: Tue, 24 May 2022 00:51:29 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Alistair Francis <alistair23@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Tsukasa OI <research_trasio@irq.a4lg.com>
Subject: Re: [PATCH] target/riscv: add zicsr/zifencei to isa_string
Message-ID: <You7kV0J5GKcMWRP@Sun>
References: <YoTqwpfrodveJ7CR@Sun>
 <CAKmqyKMRPmQVy7_6iWL9KT_S+uYY0Wzb2OZSEA86Y7outG2gHA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKmqyKMRPmQVy7_6iWL9KT_S+uYY0Wzb2OZSEA86Y7outG2gHA@mail.gmail.com>
X-Operating-System: Linux Sun 5.15.26
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: HK2PR02CA0209.apcprd02.prod.outlook.com
 (2603:1096:201:20::21) To OS3P286MB1400.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:128::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7388f06b-fe46-484f-e007-08da3cdc7da8
X-MS-TrafficTypeDiagnostic: OS3P286MB1735:EE_
X-Microsoft-Antispam-PRVS: <OS3P286MB17354D9DCABA7EC5B8AF012CBCD49@OS3P286MB1735.JPNP286.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xdf0Po34KjIaGDAhPCGs13N8Dcdi4OwlWu2TZga0lsdwDgoX7GkqPl3yVaRMuILb+zx/U+uWHO5Mr6b5luFtJEbq5E1pXcHh7Ycyvpxyk2DfGlyYJBPPH+6REq6xIUw7k56+EyTe1aOamRbqEJE09676f7T3QbNcmcXBmPZV3WPTOI3IMmwbu/i0aTXeBLMhliqOzK6Tc62vgJoXDCF/K4Sy0ftFSrxuEH6niCZc9JSs760QNNm3VdKNhZKr16EwMJmMLXyx7KdAEm9ogIAsXbUEiNZmVq1eVB8jOE9se+h82df0R/ueYEwktGPBeg8TwOnSFlQMdHd1De8/IoIoKKoATwrLxU57PLtlrFq8hab4kJlGz31Knsov3eJt8oJ8rDVTfYJC1V9PK0m7fGgweSgnOT+FC+KAYyfhH6QnasxhsphOXaid6Ax+0tqHuyIa/HvyxEGjfLulP0+xbBb6Uj8wguNyJ1O1arvgLFHJFggYpflpBRYT5iRoeZ7HcfRgKWrIA23LXY8fdX8/ziXv7zBSsBvouudK++PwwvnKZuOxgW/5tbbFGLqqbv217HnLk1J0SH4KqImk3ze7zDcr4auQwSKk7plgSeO5547c4CQQmBXBBWbuVIPue561O3ESSW8PQXUfAtWKJZTjTDvibZRGFwhx+Xv4IUnX3iwJqYP5bOrTVwpGvwzYs34eg5zrwAb4NiQ/8tO1D8UYFCnUjLhQ2QkUAdRWHwPWEOUrfVqGVwKvUW6F9IU5SDIIrPjAAGUGTraLh1tBUGnfs3iOHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3P286MB1400.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(346002)(39830400003)(366004)(396003)(136003)(376002)(966005)(66946007)(4326008)(66556008)(8936002)(508600001)(66476007)(316002)(786003)(6916009)(54906003)(8676002)(6486002)(186003)(83380400001)(5660300002)(6506007)(6512007)(6666004)(9686003)(2906002)(52116002)(53546011)(38100700002)(86362001)(41300700001)(41320700001)(33716001)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cvg4KyQA5GvsRT/2OiDeYEEeJ9fvF/Vd9e8bEBCEVhAFxSY3e2UnxF5Ak/1c?=
 =?us-ascii?Q?xwEbaJ/fc18Dn6LHsZF0LZDyJMsNyG6s/uNzFw9d3ZIHXB50QW4nY/yGU6Z0?=
 =?us-ascii?Q?k789Dob3ZEqL7pbRhdQfcUzNM54muGdFuYfKRn72/IfkeL6tb1JGmv1u7FoC?=
 =?us-ascii?Q?enEDTQPy0xgX380TJmuTjaYbSoVbAeI1a/izdqr8PiEo3swP1J53bHTnd2Hq?=
 =?us-ascii?Q?fPgO6yj+MjdsRxOnFuW5zhCsFinjaV35Kqud2Wy5pK8Xieh+kdFhXp3PNDfD?=
 =?us-ascii?Q?FJQA6BxzoXoNbQDwJYHnLOBw4di4e30PvVGU08jC1TjmZ5Mxz2blc1vKzfF9?=
 =?us-ascii?Q?8ttQ72MDYJZ7Yh/6lYkv2FYMhnvmS6kCrdgb9JLt+k+m4t6FIyqQADV1wU5m?=
 =?us-ascii?Q?NIi4GtUjeila1Du9FBrWBgOFJiwvEnC8Hj76NId07nVZvSpMMAkYu8dj33Qd?=
 =?us-ascii?Q?2iog9b/6O/5dXalCyINB9KncTIfMa3m0jkJzSKwoPSxBuIcnIr4nzBpzRO6p?=
 =?us-ascii?Q?/yWbRL/U/S/v5zD/q8KkGtbSFIfqUgmzw1top1O6ofJnw21kpaFhLYXO8xf7?=
 =?us-ascii?Q?pm3LJqid2hxG72Fb6tgnqcw3IMqXO7ZJvapueztB6Nyp3kaZQQZQ47dq6p08?=
 =?us-ascii?Q?uFfGt+mBa17OQiz9UgRu8ryDWRhkawQ/MW/rd5MAnxuGJRhTMwX/cj/TaXHI?=
 =?us-ascii?Q?7n74QROdc7ClxnFexpwXSMtOPaCCARzothwGAiNN64RAmKbZpYewkRSxZemE?=
 =?us-ascii?Q?z8tgkqAOXKMcszyaB+hdS3HayVTwiKnNrDs5u8uvteUcA/tycONCJS4Np7z+?=
 =?us-ascii?Q?KH84OfRC22KeE8U/JnrdK9dw6PrY5N84A5yAB6jOEtMAFRqxXY6s/fOYDHmA?=
 =?us-ascii?Q?MzFEUAvtfEXnRgsA3P+8WQeK+b8bK0oGIPDGVrgr4pl7PnSlaEktqVFuz1jv?=
 =?us-ascii?Q?Fp45mTVzkyB8rD1TfAFx5j/M6EkYdbKuPdike/Dpeeuyr223TnvC+HNwnQ3u?=
 =?us-ascii?Q?+9OW+Vsgn2FFax4S3YEBDcOYQQO9EsmoqGPifDQ/PIEqvs5Wsr0lDtIOHegp?=
 =?us-ascii?Q?W8XsMLI26ggj/kU4gZFIKadcq3ApNg0sVR0+9VDBZCCmF9RIAu/nZsV5J0xp?=
 =?us-ascii?Q?XjUABBcUh/8e1ZehU+ns6jU37rCtNu2/AuNOM5ozxMDvJcWLmVQPh/20AGw6?=
 =?us-ascii?Q?sMV5djawbe1jpTD2x9RpRza4jxTa8NQ//QCRaKr3N8GMKLoAC6SHtQSCO6et?=
 =?us-ascii?Q?T3jutkia7xS4trmw4WnfGAzrH1cA6qjv2lnTDjh8oETiM9PZHh3UyHDj9CwB?=
 =?us-ascii?Q?aXVuo1Q3R9UrbOKaHelUQWjrQCyd82V+V46zB5LW/y2tzEwZxH+SJUl15bbq?=
 =?us-ascii?Q?32etneJycRd/w2tVu0CeDUOdu2YKwCn/lb9DA4IUD+E1efDcgagRxTo+nihA?=
 =?us-ascii?Q?VNG8r82ffn6ByqkSPB9yqVTZL+prRvCr8p87YVNaWGCF/EymBsAWpXN4UGk2?=
 =?us-ascii?Q?NCp/mVEg42zLKSUs+iun7o7OsbO1jxSr1UPXc0wFc1CGmWC20vIjY4FQx6Qm?=
 =?us-ascii?Q?Xz2/6N3QztG9XvsFPtM63JphBXl8JztvuviSFSaUgEME88OWzQ7FGjl1Z9ze?=
 =?us-ascii?Q?Jq6DLFeVBsOFjgVrW1MbduNfv8RzaTLn7tVeGPqqi01PCQaWACw0xEG1+Hg4?=
 =?us-ascii?Q?j9Jma34idET28MmTFvc1Dzjbv1bJZCIM6dMu+pSi0PmnU4jpzdWLK65qPJdi?=
 =?us-ascii?Q?E+vpMKO5TA=3D=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 7388f06b-fe46-484f-e007-08da3cdc7da8
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB1400.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 16:51:32.6768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndC0S1L8AUvLqr2En4R3ctsHmsRO0Onqzua2m+xhx9BK3Ne+W06Dv1rylF2oCtlD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB1735
Received-SPF: pass client-ip=2a01:111:f403:700c::726;
 envelope-from=i@zenithal.me;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 23 May 2022 16:51:47 -0000

On Mon, May 23, 2022 at 09:22:15AM +1000, Alistair Francis wrote:
> On Wed, May 18, 2022 at 10:50 PM Hongren (Zenithal) Zheng <i@zenithal.me> wrote:
> >
> > Zicsr/Zifencei is not in 'I' since ISA version 20190608,
> > thus to fully express the capability of the CPU,
> > they should be exposed in isa_string.
> >
> > Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
> > ---
> >  target/riscv/cpu.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 6d01569cad..61fa9b97a4 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -1027,6 +1027,8 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
> >       *    extensions by an underscore.
> >       */
> >      struct isa_ext_data isa_edata_arr[] = {
> > +        ISA_EDATA_ENTRY(zicsr, ext_icsr),
> > +        ISA_EDATA_ENTRY(zifencei, ext_ifencei),
> 
> Shouldn't we have a spec version check here?

I think that can be done, but most of the time it is not necessary.
For old specs, the "short-isa-string" can be a workaround.

This patch is actually a follow-up of "target/riscv: Change "G" expansion"
https://github.com/alistair23/qemu/commit/72bd25b7b88d0536bfb5666990e296587d4057a5
where "G" is expanded with "zicsr"/"zifencei" without checking
unpriv spec version.

From the summary from Kito from gnu toolchain
https://lkml.org/lkml/2022/1/24/537
we know that there are at least 3 formally released unpriv specs:
2.2, 20190608 and 20191213, and frequent informal release from
https://github.com/riscv/riscv-isa-manual/releases

If we add a spec check, we need to add a PROP_STRING and
and parse the version. We then need an enum like
PRIV_VERSION_1_12_0 and we needs to g_strcmp0
in riscv_cpu_realize, just as what priv spec had done.

And we need to define a default unpriv spec version, which
should be 20191213.

I can add a separate patch for it if you do think it is necessary.

If the guest does want old spec version, I think the recently added
"short-isa-string" option from Tsukasa OI is suitable.
Instead of -cpu rv64,unpriv_spec=2.2 they can just use
-cpu rv64,short-isa-string=true to solve the issue.

Cc Tsukasa OI

> 
> Alistair
> 
> >          ISA_EDATA_ENTRY(zfh, ext_zfh),
> >          ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
> >          ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> > --
> > 2.35.1
> >
> >

