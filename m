Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35040CA5FCC
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 17:18:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBxwj-0001AX-Vx; Wed, 30 Sep 2026 13:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBxwh-00019i-1y
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 13:18:19 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBxwc-0006YK-Ee
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 13:18:17 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UEvJ1m274098
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 17:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RniTDDMG82IEM77nUIb7XymL4YdAieiaVPlgPhw0huA=; b=Nsdzey3t0Fl2hyau
 zrKizND1gbF9HDySAdzCjAlr4MIt219HG15w3ewocZuAUte8QmT37O8oUYreEJEU
 f9HL0SQZHktYS8G/gHh/3EzCGvbMF3eXP4XOuxnbGbcGzb1fpDhqIZw2WCLMAJVs
 beizXZegtUegrmMVKY+KT9qjNLnk7kg1i1mQrfMbbTKMuiSHQ6OMcE/sy402y5ve
 9av0hlWNqB2CelihLaz1JgX5Hk9Gze44fwP2lYYZRwS8PFFLBco/al+2eA3SPowh
 njZfgbB5F/WBWep4VKXsVuzcvdBrjz6zjeo9im5EtDDCYio/YKQo8qmdMSRkw9rj
 hBqHRg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n20puc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 17:18:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93a0312937eso744555185a.1
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 10:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790788691; x=1791393491; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=RniTDDMG82IEM77nUIb7XymL4YdAieiaVPlgPhw0huA=;
 b=fpb1z8E6+Ou/kBofVF66WAz75H244sbBLlwaVRZC75wqofIZ+3xTgbbLlLispyi4pF
 JkOJ5o2JOS0N8Qk+oMbfWBLsUwEy/2OiHyTMWIYmiONbCemySbdaDukzdxCrIP2IQ0Kn
 f3Qzdf3PuZi03JdpVCCt0j3OUiV9cKrHWVvbD+zfd8P1ec8EpTXasFluFDV0SzLLlJvZ
 5EHQD5mGcxa4qodIA45gI+yN34kvXsheUMOK/MwVdxus6EiRuLFm3uL5H/u5QuVh7m7S
 tb6VVEG4oKdF9pk/a0fo27y7lKc0yuJ5RZAZeLB0NRQHPt1CkFtHfNeYFU3JKl9gRS4B
 683A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790788691; x=1791393491;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RniTDDMG82IEM77nUIb7XymL4YdAieiaVPlgPhw0huA=;
 b=C3618AdkdvBqG7Mx4sSwAhpGer6Xc8qbEFRG9IV9GMg9aVkqgvTph0zsofmdE7/2i8
 +AJT/G2fhIqiGxWvJrL0Y9XQY2RsDlKkQZgVKzecNMmuf6eTDcGs2rhogKbX3JC2v0Mc
 4W99S79ug8KkM8wgMzMyF9EQAj84/CDgec+R3H0SxRg+jET+F0sKkA5YmVG3sRb1o4uH
 kaRPD+uGKdj9VGZpW1QfXDEIQzn67qH/Jlkw1PMfLMcmpSlBgutAlaeT2u75Y0PcwS5s
 OD7KHCc3JcUXyPDhQpxfXn/2rNl4dUaolHYEv57OIrs7NY67zHgJlRiEwxXrIgVSoQxq
 pbcA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxnWdaaddvlDZU25o1zqO3tTsGP+x6QolZkHy/jFzjdcqYEn7YyQo/VcnnOJkycWtGm31X30tNV4ay0@nongnu.org
X-Gm-Message-State: AFuF++nd7BY4/HgeGv2h3aO7bhOpzESp2MIWUzrVOgMklCnLiVDyGBoE
 sm9+iok9NJluaWIqAeg/PVUqPAndf6eF58xumvRRtpKZZZ5rmF9iwQhAcQg+hQlGIZvkp45XjkT
 aUeIpcaLpbBlDTWDxUKO34OWb+9Oi033D7Mx/yRWpdjXFheRmXRLyjUaclQ==
X-Gm-Gg: AYBFou2RPv66xBE7vjP/nCla5aJI8tFOf29t7/gMeJQoJtJX9N4vaWkwGc1d9C+OgR8
 ZtgfW0dGsWKUSp948VLbuXCwo7vQTtpkvt2vBlAnWabRrpZMiqGiGEegHCWbTQVddWRiwszjfT6
 KmKCheaIjpcDXPJZDBvgmRv6ShhktpekjrcW7hWOpJ4LFWb7LzNe504rhvj491xRM3Lx4jBYOXn
 VnUsYKK6t5GRHEi2qLRkSUQvAK1+TF66qqeHaj42JoYnTCr62E14rLPkbZDIZM8D4ptxweIfReQ
 ePN8qOBPjVLq1reF2x4T/JENullnQQUELz4sTs3dZ7novTUmfqRAVRy7AKVUmOPropBFrJwzaRE
 Rnw2Cni9hmM3dUCiKUYRToXrIEkyM0JaUoQ==
X-Received: by 2002:a05:620a:2728:b0:93c:a709:e8f9 with SMTP id
 af79cd13be357-93ca96930c9mr372355785a.22.1790788691100; 
 Wed, 30 Sep 2026 10:18:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2728:b0:93c:a709:e8f9 with SMTP id
 af79cd13be357-93ca96930c9mr372349785a.22.1790788690589; 
 Wed, 30 Sep 2026 10:18:10 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cb8abc1sm10313645e9.0.2026.09.30.10.18.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 10:18:09 -0700 (PDT)
Message-ID: <1b9d9cef-8f65-4e96-9e7b-fd136f64a75d@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 19:18:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] monitor/hmp: replace MonitorDef with GDB registers
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Chinmay Rath <rathc@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
References: <20260911-query-reg-v1-0-0c04f0c02cf3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260911-query-reg-v1-0-0c04f0c02cf3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abd4454 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=20KFwNOVAAAA:8 a=DDMjwm-puq-sXqiEz9gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX92gyCSGevyzQ
 7E/69AyHhcTcvt2sKo125k0vLf5vuEkaFGXP9eE57YWAuii9BTLYtteO7L6GHNmD+x6sJsInZTm
 J6GJPclLxzce/SydCZ6h9GMusMYX/ls=
X-Proofpoint-GUID: 8T-8Z7AVsrqK7qo2ytPM20rH0PA4RSy8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfXw9E/xrVn5748
 SzrG5Wx0zmDl5JrH7P2u7ZCKTPe3Y3pvVts1YKPP+pWe6Y7/0nxiP/q/FUQPLCA3OBq8cgoVZK0
 sjouvpklPNWJlGrpVYRQi43Ce391p+aCsPgfJRiK0FZDTJkvuNXA59scfewKrhrzPOAaAUC3cFe
 Ub3+UgAlMTfoApNjeTYWgs3uUpiwNmTNpFKHyklhoBE2QyOZho9RBG3D2L8m90wL6kyisESLLMf
 j2PKoFyGx+/6P/DWmLN5TGz8pqI2JNxpLbiYHdP88Rl2oSFcz3i0hkPd/04sLrd8+ChvRxxC+3t
 60xoY38L+c9YGt1Dm8ygXWad8ocb8p6L3ci8QYHuKxCzRhYLAfTbaHsI+9in9akrrXDAMDk8ITc
 Dvnm8ExuXIQukgaY/5BGDZugAWQyqzK7YXA3cW8xi1XcfsirRuubopmVsHTR+lkT3dYY99vmuLl
 gqpoRzmxvhfNelGe76A==
X-Proofpoint-ORIG-GUID: 8T-8Z7AVsrqK7qo2ytPM20rH0PA4RSy8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300068
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Cc'ing Akihiko who worked on gdbstub.

On 11/9/26 14:27, Marc-AndrÃ© Lureau wrote:
> Hi,
> 
> HMP monitor supports printing $register expression. The lookup
> was done via GDB stub registers, and supplementary MonitorDef
> HMP-specific tables.
> 
> Migrate HMP registers to use the GDB infrastructure and remove the
> legacy HMP MonitorDef. Use a "qemu-debug" register group, as they are
> aliases or synthetic registers, but gdb doesn't seem to care.
> 
> Known behavioural changes on RISC-V: CSR lookup is now case-sensitive
> and vector registers now report "unkown register" instead of a
> target-specific message ("Unable to print the value of vector vreg 'v0'
> from this API")
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
> Marc-André Lureau (10):
>        hmp: don't crash on invalid register
>        gdbstub: fix next register base after register gaps
>        gdbstub: set feature->base_reg for dynamic features
>        target/i386: expose segment limits via GDB
>        monitor/hmp: add CPUClass::get_pc fallback for HMP $pc
>        target/m68k: expose system registers via GDB
>        target/sparc64: expose system registers via GDB
>        target/riscv: bypass smstateen check in debugger mode
>        target/riscv: expose register aliases via GDB
>        monitor/hmp: remove legacy MonitorDef infrastructure
> 
>   configs/targets/i386-softmmu.mak          |   2 +-
>   configs/targets/m68k-softmmu.mak          |   2 +-
>   configs/targets/riscv32-linux-user.mak    |   2 +-
>   configs/targets/riscv32-softmmu.mak       |   2 +-
>   configs/targets/riscv64-bsd-user.mak      |   2 +-
>   configs/targets/riscv64-linux-user.mak    |   2 +-
>   configs/targets/riscv64-softmmu.mak       |   2 +-
>   configs/targets/sparc64-softmmu.mak       |   2 +-
>   configs/targets/x86_64-softmmu.mak        |   2 +-
>   gdbstub/gdb-xml/i386-segments.xml         |  14 +++
>   gdbstub/gdb-xml/m68k-system.xml           |  32 +++++++
>   gdbstub/gdb-xml/riscv-32bit-alias.xml     | 105 ++++++++++++++++++++++
>   gdbstub/gdb-xml/riscv-32bit-fpu-alias.xml |  40 +++++++++
>   gdbstub/gdb-xml/riscv-64bit-alias.xml     | 105 ++++++++++++++++++++++
>   gdbstub/gdb-xml/riscv-64bit-fpu-alias.xml |  46 ++++++++++
>   gdbstub/gdb-xml/sparc64-system.xml        |  22 +++++
>   gdbstub/gdbstub.c                         |  14 +--
>   include/hw/core/cpu.h                     |   2 +-
>   include/hw/core/sysemu-cpu-ops.h          |  16 ----
>   include/monitor/hmp.h                     |   6 --
>   include/qemu/typedefs.h                   |   1 -
>   monitor/hmp.c                             |  52 ++---------
>   target/arm/gdbstub.c                      |   8 +-
>   target/arm/gdbstub64.c                    |  10 ++-
>   target/i386/cpu.c                         |  32 -------
>   target/i386/gdbstub.c                     |  24 +++++
>   target/m68k/cpu.c                         |  22 -----
>   target/m68k/helper.c                      |  47 ++++++++++
>   target/ppc/gdbstub.c                      |   2 +-
>   target/riscv/cpu.c                        |   1 -
>   target/riscv/gdbstub.c                    |  52 ++++++++++-
>   target/riscv/internals.h                  |   3 -
>   target/riscv/monitor.c                    | 140 ------------------------------
>   target/riscv/tcg/csr.c                    |   3 +-
>   target/sparc/cpu.c                        |  19 ----
>   target/sparc/gdbstub.c                    |  38 ++++++++
>   target/xtensa/cpu.c                       |   2 +-
>   37 files changed, 562 insertions(+), 314 deletions(-)
> ---
> base-commit: 209b2afaface001c7d4d981e38f186afe7b24a50
> change-id: 20260910-query-reg-80cd59cf4707
> 
> Best regards,
> --
> Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> 


