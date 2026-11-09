Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09067606A321
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 14:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kQKFLKmI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ikKcrwuv
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQQnF-0006bD-UE; Mon, 09 Nov 2026 09:56:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQQnB-0006aR-79
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 09:56:17 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQQn9-00076O-3Y
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 09:56:16 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9DF2xh2928715
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 14:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YRlk1pestbQlTsjovk3c8h4NmWIedcJCYkkVcV/nZKg=; b=kQKFLKmI2MFWCWPq
 0BknjrGyHnXRdgeOho1ahFs+rQfypeldmDHGxlO+Qi+ZuvD5WB65C8Uqp6bqo89h
 Kc6Sjkl+Gkyq7+E9oF7auEA2lLYCjcvhbHfkwM75iDO9RuEkxbmPbp+GlIsC58Vu
 z9SoZ70CI1pU5DieuLWpPxsoNiY8kEGiXDoKy3QFQ5x7PbvKZBjYsSaeSNwRoVj0
 U9imyj6cBJgQbzBwNPsmytjx65eRICbZUtcBaW7BKgKlEXdJzWflmYHjNqDMwpf7
 p4TrO0EMAOmfR4gvAl+8yZCN9QKPj0CbXMX2QeG5Mv11ggv5T56ciiZasU1JLL2/
 1iTRAw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hubt8s26e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 14:56:12 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-990c957f129so838039241.1
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 06:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794236172; x=1794840972; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=YRlk1pestbQlTsjovk3c8h4NmWIedcJCYkkVcV/nZKg=;
 b=ikKcrwuv9Ar08YBlnSUes+IvG7rRv6UrL3ECVZjzxBQOUKNc6Om5BtPm4jy6n0XIF9
 51fq0enGptC9XzKaByvqJymbutwLxPxkOa0pJJbnH1wQdvtCoTZumuOE4pF5AfEq9bYe
 UIICEcY2l2SVtn9Qo282sN++YaGCUOcGBTiMJfHfWsdVHfymAZ0srvkZM3mtu7j7qO8W
 zSMIkuRYlbeWGgg3hVVpqFQE86ZpIFfZijqnui1PdE69cuon/JWAU4QlzyxImoAdQS8A
 NgaeFEJ5AoE9EKvQ0Eb0YjHHPgTc5N64/3KFi2bEKhAhPTEHARPydRo2aESelHChpLYQ
 ZqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794236172; x=1794840972;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YRlk1pestbQlTsjovk3c8h4NmWIedcJCYkkVcV/nZKg=;
 b=prHW4rdXdtX/lZYz8i/MV4lzrU0w3+iPr1Du0peLPLaV8CSPuxzIF6rm9O1lwByDWn
 /dOfuY0n/AoS7N6N2SecJo7Bb+7tu3dfBtGlND/vLlbBohycuI4Cq3ieVWjilechpcjt
 l5tY3cMGoSf31sFxPl6tlyf0oy69LL1QC7zlnUQs08LXvJZ7+XL/sd2OsEl1QdYNY3u6
 IJVmJ/d8ANlhJNZAGEhGVA1bE/VcxOxFNXLQzBlEUZfZFmRkrGmEzrn14qQmJwm1cfWJ
 nEwvMCaEkEXZTmH1iKKY3nc6Pj4oZdQHR1tE05tob1dCBhhdGOoabd2hnrIB2knSRbPn
 CbMA==
X-Forwarded-Encrypted: i=1;
 AL+hErEqfsG4LZVS8KtDjGIvjZ++ZYPxyuY8qP9kTtjfS0Q3lEqVhUTWKaDid5IOjzWTaJprDt3o12aksBYx@nongnu.org
X-Gm-Message-State: APuU4Z9yq5DewNXGNopZTPsOcLrq0wVlxDaLfbBE2m0y9DwpDytz95qf
 9XHwvloJZyuWQM+sxAehJ81qB3ZJoqfrs0dxAShFrhx6kfiAQlhcPBrULamuZxy/AsyQs2bcBZw
 bmhMVWAyzkH48/9eQYR/otrexkiHGNvOFDuAjmd6bhtTwxPmeeIrf4koqqA==
X-Gm-Gg: AYBFou22M0+zTl/JBWlX6EirfUXxo29Lx3DJUcSyD7+8XSRpWBon2h2mykoi9JqLDKi
 r6cXYzD0B4S28Fz8yggwW2UtRCM4cQojTCjKPD2f9rEXcuV7pcbmv7bXDmM3imVaf7fyxmuH4KG
 fGYc0qNxLXh8kYutbx2Vt9fGbw23e/v3coEx+p32cJcufdZU5i41yI2M5Z5x7YrgdD40nKXR8/u
 3WHb1Cx+UW7lkfEIEIkDMbR6Xu1n8hPnUB9WBgQiOOumnRi/eHM1345yRJYWmSjHa75R/Yr5NYm
 oCiDatACHB0msKViWGgy72i8FaOKtK4l6K/epzAYNwlpLN1R9Wp8fDq0ZGBSF3wEQqzNM+LFnLl
 ROlo4HG0PuO3fS995ygibRe9RbIB8EOrhxlADJbF9hg6ApFjhgf/1y6kg0/pvmbvzQzpO1kisCh
 MuMJukFQEv
X-Received: by 2002:a05:6102:4457:b0:7a5:673f:9a37 with SMTP id
 ada2fe7eead31-7d2db1ace8fmr662996137.15.1794236171480; 
 Mon, 09 Nov 2026 06:56:11 -0800 (PST)
X-Received: by 2002:a05:6102:4457:b0:7a5:673f:9a37 with SMTP id
 ada2fe7eead31-7d2db1ace8fmr662990137.15.1794236170986; 
 Mon, 09 Nov 2026 06:56:10 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-7d2db6b9a8bsm4351312137.10.2026.11.09.06.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 06:56:10 -0800 (PST)
Message-ID: <e15c5396-ce78-4ab0-9d44-51210c843766@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 11:56:07 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/tcg/riscv64: test mstatus.GVA on traps into
 M-mode
To: tewaro <tewaro@theorem.dev>, qemu-devel@nongnu.org
Cc: disclosures@theorem.dev, tewaro <tewaro@tewaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <cover.1793677945.git.tewaro@theorem.dev>
 <ca62cad0fd9d3f57f20624e11da8e10cf84028b2.1793677944.git.tewaro@theorem.dev>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ca62cad0fd9d3f57f20624e11da8e10cf84028b2.1793677944.git.tewaro@theorem.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX76SPwF7HA2Cd
 EOYk3ydoQRH//hlZJ1HwjJJZp6KRDYxc56Fx0HED6JDXHAbtI+0i8CWwSL3LqW4V4CUBNxnqZXB
 +WTyrmQa9cB6DCyQeCcwPUCd7rH8XPPsACHh1eZuM2hnaSUabcf9BMufzeDXZk/8AI0C5YolXw9
 ecrKIAU3c06FHQ2INfUWigraCI9EffSkQntn+2bRcOuBYhDM4LkD2AcmX8ZDdf+0C5uF/2fdbA2
 pQTvP7yn8/5B/7dV0nbEZwhmiB5w3FR1T7qI+7An+SIu10MV/Bw+uW4DMLUzdA5bMhmjv8uzUWc
 WGCp9G9NPbB3M4XzjyZKS3jh1lgU9KCbhyxSvTNNRyHXZQRWmSFNMwbnMDRP79UFZQZokKVU55U
 HaIDcNqdhI+YD5DTY9f1TYJYGRLPE/B8YkTEtELm1+r/jafAdqJp07uDglDTWnPxTaqV3WGHyi4
 nyomPQ8xqQPH3IC17Ww==
X-Proofpoint-GUID: Bm7c9-ks4DNZcPpKE65Y8Bu9quKjlJX9
X-Proofpoint-ORIG-GUID: Bm7c9-ks4DNZcPpKE65Y8Bu9quKjlJX9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX9ryu6NUmw2hT
 /nTTVCLjhj6wHYzYK/u1/E4FUUGYlLp4sWdyFC89/tS78rQC/fI5GwW0KtIJ0RUUa8KOoLAcVtd
 vvI6Rhx/UReOfq2Op6lUvAKAVK3/Okg=
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6af1df0c cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3dLJRrOx5JH9x2WreFIA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090059
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/3/2026 4:42 AM, tewaro wrote:
> Every trap into M-mode writes mstatus.GVA. If mtval holds a guest virtual
> address then mstatus.GVA should be 1 otherwise it should be 0.
> 
> test-mstatus-gva checks 4 cases:
> 
>    case     access  from
>    -------  ------  ----
>    load     ld      VS
>    load-vu  ld      VU
>    hlv      hlv.d   HS
>    hsv      hsv.d   HS
> 
> Each case makes a guest-page fault and checks that GVA is 1. It then
> runs an ecall in M-mode, whose trap has no guest address, and checks
> that GVA is 0. Without the previous patch QEMU fails all 4:
> 
> - load and load-vu: GVA stays 1 after the ecall
> - hlv and hsv: GVA is 0 after the fault
> 
> Each case is its own test, built with the -D flags listed in
> meson.build, and exits with 0 or the number of the first check that
> failed. It uses hyp-guest.h and hyp-guest.S from the previous series.
> 
> Signed-off-by: tewaro <tewaro@theorem.dev>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   tests/tcg/riscv64/system/meson.build | 21 ++++++++
>   tests/tcg/riscv64/test-mstatus-gva.S | 75 ++++++++++++++++++++++++++++
>   2 files changed, 96 insertions(+)
>   create mode 100644 tests/tcg/riscv64/test-mstatus-gva.S
> 
> diff --git a/tests/tcg/riscv64/system/meson.build b/tests/tcg/riscv64/system/meson.build
> index 05ed8b4c8f..e1c478196b 100644
> --- a/tests/tcg/riscv64/system/meson.build
> +++ b/tests/tcg/riscv64/system/meson.build
> @@ -130,6 +130,27 @@ foreach name, flags : gstage_tinst
>     }
>   endforeach
>   
> +# test-mstatus-gva.S: one build per case; the flags are documented there
> +mstatus_gva = {
> +  'load':      ['-DMODE=VS', '-DACCESS=ld t0, 0(a0)', '-DREG=3',
> +                '-DFLAGS=PTE_R', '-DCAUSE=LOAD_GPF'],
> +  'load-vu':   ['-DMODE=VU', '-DACCESS=ld t0, 0(a0)', '-DREG=4',
> +                '-DFLAGS=(PTE_R|PTE_U)', '-DCAUSE=LOAD_GPF'],
> +  'hlv':       ['-DMODE=HS', '-DACCESS=hlv.d t0, (a0)', '-DREG=5',
> +                '-DFLAGS=PTE_R', '-DCAUSE=LOAD_GPF'],
> +  'hsv':       ['-DMODE=HS', '-DACCESS=hsv.d zero, (a0)', '-DREG=6',
> +                '-DFLAGS=(PTE_R|PTE_W|PTE_A)', '-DCAUSE=STORE_GPF'],
> +}
> +foreach name, flags : mstatus_gva
> +  tests += {
> +    'test-mstatus-gva.S': {
> +      'exe_name': 'test-mstatus-gva-' + name,
> +      'cflags': cflags + ['-march=rv64gch', hyp_guest] + flags,
> +      'qemu_args': ['-cpu', 'rv64,h=true,svadu=true', qemu_args],
> +    }
> +  }
> +endforeach
> +
>   tests += {
>     'test-vle32ff.S': {
>       'cflags': cflags + ['-march=rv64gcv'],
> diff --git a/tests/tcg/riscv64/test-mstatus-gva.S b/tests/tcg/riscv64/test-mstatus-gva.S
> new file mode 100644
> index 0000000000..ec8b6df25a
> --- /dev/null
> +++ b/tests/tcg/riscv64/test-mstatus-gva.S
> @@ -0,0 +1,75 @@
> +/*
> + * Test that every trap into M-mode writes mstatus.GVA: 1 if mtval holds
> + * a guest virtual address, 0 otherwise.
> + *
> + * Each build is one case, set by -D flags in meson.build:
> + * - MODE: VS, VU or HS (HS runs hlv/hsv on the guest's behalf)
> + * - ACCESS: the instruction run on the start of region REG
> + * - REG: the region accessed
> + * - FLAGS: the guest's page-table entry for REG, with A or D clear, so
> + *   that the walk's A/D write faults on the read-only G-stage
> + * - CAUSE: the fault expected
> + *
> + * The trap handler checks, and the exit status is the first that fails:
> + *   1  mcause is CAUSE
> + *   2  GVA is 1, since mtval holds the guest address
> + *   3  after an ecall from M-mode, whose trap has no guest address, GVA
> + *      is 0
> + *
> + * `trap` makes checks 1 and 2, then runs the ecall, whose trap goes to
> + * `ecall_trap` for check 3.
> + *
> + * Privileged ISA v1.12: 8.2.1.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#include "hyp-guest.h"
> +
> +/* exit with status n unless reg == want */
> +#define CHECK(n, reg, want) li t6, want; li a0, n; bne reg, t6, exit
> +
> +/* read mstatus.GVA into t5 */
> +#define MSTATUS_GVA_SHIFT 38
> +#define GVA csrr t5, mstatus; srli t5, t5, MSTATUS_GVA_SHIFT; andi t5, t5, 1
> +
> +        .option norvc
> +        .text
> +        .global test, trap, hs_trap
> +test:
> +        li      t0, VS_L1 + (REG) * 8   /* the guest's entry for REG */
> +        li      t1, leaf(REGION(REG), FLAGS)
> +        sd      t1, 0(t0)
> +        li      a0, G_RO
> +        call    set_tables_perm
> +
> +        li      a0, REGION(REG)
> +        lla     a1, probe
> +        li      a2, MODE
> +        call    run_guest
> +
> +probe:
> +        ACCESS
> +        ecall
> +
> +        .balign 4
> +trap:
> +        csrr    t5, mcause
> +        CHECK(1, t5, CAUSE)
> +        GVA
> +        CHECK(2, t5, 1)
> +        lla     t0, ecall_trap          /* the ecall below traps there */
> +        csrw    mtvec, t0
> +        ecall
> +
> +        .balign 4
> +ecall_trap:
> +        GVA
> +        CHECK(3, t5, 0)
> +        li      a0, 0
> +        j       exit
> +
> +/* nothing is delegated to HS-mode, so no trap should come here */
> +        .balign 4
> +hs_trap:
> +        li      a0, 1
> +        j       exit


