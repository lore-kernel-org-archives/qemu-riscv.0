Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FE1CD4F54
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 May 2026 19:36:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSgWo-0002E2-P2; Thu, 28 May 2026 15:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSgWn-0002DK-1w
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:36:25 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSgWl-0004vj-3h
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:36:24 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64SJWxw71960108
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 19:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4p0Mt7RpT5EEvm21fb7YUny775Q8OF/TNxHs7MQ84I0=; b=VcbEyy/T3BaV/vhD
 m+iE6cKn4a3sDXpBD184YZD+pHteSgjNtVKN4Z8GF1JzJ3ZBvVlpBUgFkLxkccB0
 qaDX5F6aBC+hmzmjnPJQYUmtLMJif1sL2t0kKzWb6PLwQ7o/56GIRUtZwe6+cbEd
 axyzpojpRQEGSFH4GvB3Qad8SAJy2CsI4S/H6o4wQiSCzxamzJaW+5u+Oajr3Ccq
 ctM9nbcrcYuFBG5PwgrXrPWmcKqJXE6U4K2E6YGk+MCodhH23mbGXXRlkPr16tXD
 fra7Y7gVW67Yaw828pBzCBQTlpUq34LlfhGOT1hvbibLf3mjlWI7CLdq8NJAgRxI
 IIkhcg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eeuy580da-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 19:36:21 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-304ea42b025so12151eec.0
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 12:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779996981; x=1780601781; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4p0Mt7RpT5EEvm21fb7YUny775Q8OF/TNxHs7MQ84I0=;
 b=RBaaECk97bgSg991meyNAtp7pvQFMJzlnIjRLb6NWXSYZhNO2+cwPYBg8ZTMzsoi9y
 ur3VjEqAYYp9Q0CYE4nIFOCCzjQiyookwd8nFA+N0Bpjfh8GkKDIJZwsxnv6qs6iOO4D
 DSOrjJqfABv3LB+0dAk/qwrhopZMHStJjH8GbfysoEugoIYJgqJ268kTTAEto8/JJj7/
 jtlylNN2ueesNzYhz2Mr6CFgI0pbDT9K0YebIfZk5LtjQtbI3F5AA2H/C7YnDRQgrkIv
 RLnl4l5TmSp4XjJIy+a8Db5zAypUhK7GjYWPwkFLw4Y12wcL0Qesmm5Vw4tdlMsN/stP
 97Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779996981; x=1780601781;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4p0Mt7RpT5EEvm21fb7YUny775Q8OF/TNxHs7MQ84I0=;
 b=Y/47V+WvDjuNvE0KCYLqEDlMg/b8bjDIomLQ8QuBDggBzeUMp6UXUwjbt3Oxd2Re9B
 DQrKLIv29Ge3D90ojMGAZQWkkQGf+Sg4WTsTxMFxEaLu4H74yCO9tkgtajlXCfO8EcbM
 p7Ojb0zNw4O6scdWE9FUZW1ya/XMcdD/XdgvrYNJToFipKozGVPkfWHDe1W8eFOgjSHm
 Md/9bMQEh6IMGKv/PuPWri2G5rMB/vjY0lyVS1fwfVVkE67BxWEAKIDM5EQjdC9YyA8X
 4SQ3O01y61dkCilHaJTAhPPRIQwMDrs9b/K0TemXF655hCxTGTLCAKLfCUYBMtOH7iNq
 Mhqg==
X-Gm-Message-State: AOJu0Yw9q5WIDPu+SbrD8CukJoBSZbAfKsQ42pkCRd8ct3pKRKmg9pe+
 osQAQ9+YrETI1XzaIAr3bk5Fi0J3E4uXdrSgRsbc9PyM4dd0c+xkZvXP5Widze7fTgEEgAqddRd
 nXik+3Jsuu5ylzOW1BPO0dcohjYqUPq2yqq/BP8wgSdvhtT18NXTyl1GniA==
X-Gm-Gg: Acq92OHnbU83/U3uZBtC5x20KL4LWJKX66+YEj7iAlP3yzUnZaW4DRazpcim43H1KEN
 U8TNBVO5OXJ5Hf2puDWHG9ZL1tP0U9Z0ke4H+djK5ebHYNF9d2Zf/2fQh1qJGKsetpLCFx5drW+
 QK28uQIYf6sad5SzIHcqaSLBJw/xlyA4aEQofIGF476TnScGKA2ry01KS5T9hLQnKBobAEBISqn
 7201l/gzSF4Ni5HqoVmb9NY0rK1CbXoatkX6deOTwwufp1Y/hL0ALsKWJKYDgZRfDC/8rOrswwd
 xNJKo3j2kzdrFjE+vIixFR9zGyPfWXWeOOXntIDRwGrGn9HCDn2gMTC6gNJPcyPE13qxmF+2g8q
 nekFP5ENQFETuwiI9Lrqsc0kUCXGsmONsbgFPgXCX/JucVQd+/b7Qm3Y3Fx1K1+iRUBX5znHLVr
 1bVRX+u+qnQC4id8bJLj5KF2cG
X-Received: by 2002:a05:7300:aca3:b0:304:d600:8731 with SMTP id
 5a478bee46e88-304ea74619bmr12068eec.15.1779996980843; 
 Thu, 28 May 2026 12:36:20 -0700 (PDT)
X-Received: by 2002:a05:7300:aca3:b0:304:d600:8731 with SMTP id
 5a478bee46e88-304ea74619bmr12046eec.15.1779996980162; 
 Thu, 28 May 2026 12:36:20 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304e98c7969sm127476eec.14.2026.05.28.12.36.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 12:36:19 -0700 (PDT)
Message-ID: <163e423e-a31b-47a4-a7af-a446a3b89fee@oss.qualcomm.com>
Date: Thu, 28 May 2026 12:36:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/12] Add RISC-V big-endian target support
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 Anton Johansson <anjo@rev.ng>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
References: <20260527201348.29511-1-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260527201348.29511-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SPtykuvH c=1 sm=1 tr=0 ts=6a189935 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=NEAV23lmAAAA:8 a=gm80Tucwmrem-aL_JdkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: a6iPgRHpUU0ATRjB4vvCkNepO0BWNhMo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE5OCBTYWx0ZWRfX97qfluhTyy72
 Wn4AWMP2vXNfjcz2LYNYVcIYHtY/ss6uJ3VGikady+Jki/oMJJ8ezqjtvcMtGoDWwKKLkiaDczc
 eGtPr5LKfu4Wq32Dw6IdSdYkmsbOFmB17k8B5Nn952jh0ba8uSRd506VWW5WTyjUDEz6fe/h6cS
 Ara58YPtXtXWT2lGdL8XVnYHiUkh6YGW9EZ8C5pq1q7X6MuXYrxCh0BnQS2ga8ngsQxt01+4YFL
 LSAXN9TW7w2oHtX1DTwsbtdGmWMh1e47ZQHA099MMC7JIWwF75XSBlWDUaa7XDSYqun2YMLmtZ+
 ENohhMIyLGQfvJQq6vBUb/UVekX+mgADWSIaD4cytSyEspEsLTwHl1e0gxQ74vIZK/wHfL5O9AZ
 3g2FlGHYXLE+UnKui8ttXwwCtmjyhfiJMQPkIi4sZXyftsA7JLoTekTcV07VRMO0Xq4FbSwJ6O7
 voCMDKw67mySgDFKGYw==
X-Proofpoint-ORIG-GUID: a6iPgRHpUU0ATRjB4vvCkNepO0BWNhMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280198
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 5/27/2026 1:13 PM, Philippe Mathieu-Daudé wrote:
> v11:
> - rewrite some patches while reviewing for mainstream integration
> 
> v10 cover from Djordje:
> 
> Hi all,
> 
> This series adds big-endian data support for RISC-V system emulation.
> 
> Following the discussion on previous versions, this series models
> fixed-endian harts, not a mixed-endian implementation where software can
> toggle MBE/SBE/UBE at runtime. The reset value of MBE/SBE/UBE is selected
> from the CPU configuration. These bits remain outside the
> mstatus/mstatush/sstatus writable masks, so they are effectively hardwired
> to 0 for the default little-endian CPUs and to 1 when `big-endian=on`.
> 
> The user-visible `big-endian` CPU property is exposed only after the data
> path, boot path, and page-table walk support are in place, so the series
> remains bisectable.
> 
> Djordje Todorovic (6):
>   target/riscv: Implement runtime data endianness via MSTATUS bits
>   target/riscv: Fix page table walk endianness for big-endian harts
>   target/riscv: Add big-endian CPU configuration field and reset logic
>   hw/riscv/boot: Honour data endianness
>   target/riscv: Expose and document the CPU 'big-endian' property
>   tests/functional: Add RISC-V endianness test
> 
> Philippe Mathieu-Daudé (6):
>   target/riscv: Initialize DisasContext::mo_endian once
>   target/riscv: Assert PTE.N/PBMT bits are not expected on RV32
>   target/riscv: De-indent some code in get_physical_address()
>   target/riscv: Remove target_ulong use in get_physical_address()
>   hw/riscv/boot: Rewrite setup_rom_reset_vec() using load/store API
>   hw/riscv/boot: Replace cpu_to_le32() -> const_le32()
> 
>  docs/system/target-riscv.rst                  | 29 ++++++
>  target/riscv/cpu.h                            |  1 +
>  target/riscv/internals.h                      | 29 ++++--
>  target/riscv/cpu_cfg_fields.h.inc             |  1 +
>  hw/riscv/boot.c                               | 93 ++++++++++---------
>  target/riscv/cpu.c                            | 15 ++-
>  target/riscv/cpu_helper.c                     | 44 +++++----
>  target/riscv/tcg/tcg-cpu.c                    |  2 +
>  target/riscv/translate.c                      | 22 ++---
>  target/riscv/insn_trans/trans_rva.c.inc       |  4 +-
>  target/riscv/insn_trans/trans_rvd.c.inc       |  4 +-
>  target/riscv/insn_trans/trans_rvf.c.inc       |  4 +-
>  target/riscv/insn_trans/trans_rvi.c.inc       |  8 +-
>  target/riscv/insn_trans/trans_rvzacas.c.inc   |  4 +-
>  target/riscv/insn_trans/trans_rvzalasr.c.inc  |  4 +-
>  target/riscv/insn_trans/trans_rvzce.c.inc     |  4 +-
>  target/riscv/insn_trans/trans_rvzfh.c.inc     |  4 +-
>  target/riscv/insn_trans/trans_rvzicfiss.c.inc |  4 +-
>  target/riscv/insn_trans/trans_xmips.c.inc     |  8 +-
>  target/riscv/insn_trans/trans_xthead.c.inc    | 16 ++--
>  target/riscv/insn_trans/trans_zilsd.c.inc     |  4 +-
>  tests/functional/riscv64/meson.build          |  1 +
>  tests/functional/riscv64/test_endianness.py   | 57 ++++++++++++
>  23 files changed, 240 insertions(+), 122 deletions(-)
>  create mode 100644 tests/functional/riscv64/test_endianness.py
> 

Seems there are some build failures:
https://github.com/p-b-o/qemu-ci/actions/runs/26537039673

Regards,
Pierrick

