Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1100CC6B38
	for <qemu-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 13:51:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHiLI-0001gO-3O; Fri, 16 Oct 2026 09:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1xHiL7-0001er-0v
 for qemu-riscv@nongnu.org; Fri, 16 Oct 2026 09:51:17 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1xHiL4-000377-EZ
 for qemu-riscv@nongnu.org; Fri, 16 Oct 2026 09:51:16 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69GAA2qf1945619
 for <qemu-riscv@nongnu.org>; Fri, 16 Oct 2026 13:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aaiMzdN1FsAMDpjCoJ/kd+lYlLRQUSBvNZtGlnn0IvM=; b=pPrDeSBhH2nGbyOF
 1jUg79meTVM/JIo5nl4OxEHKgVybjTboO+tJkFdw7UmoZvV6ee/YZ1r2zq5VAEuP
 sAWa26kfkXhB1yxGvI0Fhh3eHaYoy9dqwy28d2hXUgJViVXPhcmV9D6gjaMYJ8yF
 3CACgvcsQJsnGHNH3pcUR322YCII624ALnL6mgN9x7VBp2aqdFM3yCgMIIw0kleX
 r5ddF8c7iiRhin+r6REftGChWq3iOVAVSAvwqFQPE4g2kMt83NzeOLFYS/2CTQ2l
 y4d/kW317v22Jb7KUEHxxfXlQn4vKPfadp21K4NIclZ6jfD1/gKe9P5cwk8gF5dJ
 uVAkgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5ys8ac-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 16 Oct 2026 13:51:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93a3f673221so1941036485a.0
 for <qemu-riscv@nongnu.org>; Fri, 16 Oct 2026 06:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792158671; x=1792763471; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=aaiMzdN1FsAMDpjCoJ/kd+lYlLRQUSBvNZtGlnn0IvM=;
 b=YUa4ysl1m31p28+LC3Sq93gc16Wm6criwX8KTtZmhnCKGhH1Qec8X5TGbf9hWB+XZy
 JOhyQwADfdQ2h3sMOUXVhRW3a65z1n5Idwnu6D6H/mwzFw1Hm4KTXkIrR828xkD6Kiqy
 JZMYWfAFAc7/PG52isZgmyEEV/3/vlskVGOVXVlh9CI8/dakyV/VrTi9+NbC2AJU2RST
 s1fUE3koPCPjre1nfOI0L3kP88UlVlMSR9Hyq77JaPipI4uCLCI+2zxpvQD3hX4duhbH
 C+Zgo10xnjAHNB98aUZcjrmt3RFYC1nQUsV5BVVnO2XRKFT1B7H1hIrvhrEacICyeZs9
 FA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792158671; x=1792763471;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aaiMzdN1FsAMDpjCoJ/kd+lYlLRQUSBvNZtGlnn0IvM=;
 b=eJM7iR0XBKGIgN3aqdNkAGXt+TLobYUn+JqbrEy0v16i2qJR2MqnNvr8s4tCmO9cS+
 i2FgneRwWKyKXZLPFEANlZ7812SBXsv0WVAvovofyCrK6Cvsqbz8IplVrxfqbblxXD0/
 kP8r91W3+lCiImvd8741LV1TqsGGAQHVq48DSIil2tiHZwbEVqINUqv9K+0rkvpZZZPO
 yp5gFITjoKK4DsZ2H09W3T4MQXvWCs05DPxnFERuT2ptXeKSjF5aQe5AoVtTLZ9tims8
 aniTsArij7gtJ/HmY44mxSYuh/StUPJv6ny98Xhh3p17mPOKoAfB5KlH3/GF+dd7+RZ+
 QfQA==
X-Forwarded-Encrypted: i=1;
 AKwUvBz0eszXnJAnleBtQQzCPO8Dvv1a1GqRUPGyiK3TjvTejx+ZdoaNsxtXlB6QNis1rubsRtwjrq19MylG@nongnu.org
X-Gm-Message-State: AFq9FYJnSoWeQKmQuw+7uvnwwDCTlzyae7m51pObq7/1IWJ5RNsBrjQl
 RM5mEYtb4GDA5h5YRLig83USo8r4R8Vz52U5znNZf0Z+sBU94skNcawVFxLPSIa6klK/xUGO387
 Q9duormmBAaJZOPv4IOedoIMyLFiRbYB90x+n+njx6It5xQ4CnkNpB2gx/g==
X-Gm-Gg: AYBFou1sqZ7fssfyTm7+Vjf8QZlhyFaC1qWU36TTNZ3qdo6uCA9hStmrdiLMVWwTVau
 NXFFKb4H3MgT5n3roo07Vv5ADB2Q2gpYnf7Ic9xoAZOxPmW7Sg5IsUseTpvvOb7ih2urHY/CwDQ
 HM7z4ADdQ03jSf0SicoEjwz7bsRApSAJYRfSyRljOCQT8stfl49S/SUpWvo3nxCewE+SRQhn/Vp
 WxAMaKeJwfv2aytxYnW9WqrBJeJF1+drFN+nn+khtvMIz41CSszxY0gUwA+mglm28L5eUBhKVKB
 kk7bQJdFNBNlS4MP8CdG/JjTfsfE6jftmstdmu4YUsHKUzBfAM09oKfeV+SZfOIefmyJjPZj8tz
 Tfw2sQH4T2Mv0tU7zXvCzOBhVtW9wqBK5XINAQHgFUlsgPY1ok6KIwiGMhmLmyCkt
X-Received: by 2002:a05:620a:2248:20b0:93f:11ee:ba5f with SMTP id
 af79cd13be357-93f11eee5edmr579331685a.79.1792158671079; 
 Fri, 16 Oct 2026 06:51:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2248:20b0:93f:11ee:ba5f with SMTP id
 af79cd13be357-93f11eee5edmr579324585a.79.1792158670463; 
 Fri, 16 Oct 2026 06:51:10 -0700 (PDT)
Received: from [10.222.168.219] (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93f1a1690fdsm216994685a.11.2026.10.16.06.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2026 06:51:09 -0700 (PDT)
Message-ID: <077274ba-002e-4241-9158-13a3270bddaa@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target-info: dispatch CPU QMP, dump, monitor, and Angel
 semihosting
To: luoyonggang@gmail.com, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@kernel.org>,
 Glenn Miles <milesg@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Bibo Mao <maobibo@loongson.cn>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Song Gao <17746591750@163.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Philippe Mathieu-Daude
 <philmd@mailo.com>, Xianglai Li <lixianglai@loongson.cn>,
 Chao Liu <chao.liu@processmission.com>, qemu-s390x@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>
References: <20261015044104.879-1-luoyonggang@gmail.com>
 <CAFEAcA8n9E1jpcOCat0kzv0Q++x7YwK_MNJBJ0qGdtX1-As4zg@mail.gmail.com>
 <CAE2XoE-fgq_c9qONyvfbNi3Ys_hv7yKvGCkk+Wz+rHPW0p65Eg@mail.gmail.com>
Content-Language: en-US
From: Brian Cain <brian.cain@oss.qualcomm.com>
In-Reply-To: <CAE2XoE-fgq_c9qONyvfbNi3Ys_hv7yKvGCkk+Wz+rHPW0p65Eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wr8OXJr52CjeGRO_FZR_Mk0O-zypN2np
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad22bd0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=X7ICM6PgokHMk0l1ZBYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NSBTYWx0ZWRfX1y8/7ONqZgbf
 Jqr6ScUMjniA4FnEw2IB2TWB8C5WpZz25ft/syO5vbk+J8yHdfECQRfAGSY2nwIKcM3Eo3fmTPA
 Fm6XO8Lq+Z85Q4GtgSseOtD06cpP9Gw=
X-Proofpoint-GUID: wr8OXJr52CjeGRO_FZR_Mk0O-zypN2np
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NSBTYWx0ZWRfX3ITDl/EcWPpf
 Jp93EC1gSLeCzSpaTA1ie45ahClnLirPdiYHIkoF+MZyTbyxKejARL1xDUFGSOoFkUaO4+3pL6s
 mhrVE9m6D/VKmc8/fnD2QizMgFOyR5bob/0WkcuTGQbWtGNxNT+N63AVEuhl5ek4RJi7givtZek
 G2CdROgPL4HvMIv407eOH9ipuEXlZTl4w893FLThbPnCQeoZx53jOnCuXDcj6pPrlCQLM+CwJVa
 m5r3H3bHbb8DxJ2rdUwkocIcPmi7ppm51GGVPTeDXX9vtY/JWkAWi9FarAHEYDgbstntJ5w6oRQ
 A2OVVQFC+EkCwQcfrNmp3FYNWOTf5d6otA126Cpm02G5j3Keq3D7w8okTJRZjj53kTuiJbpgSy3
 ZaMO0rmSMUKuag2yTMBr9y1bSbjDUyLBt0XkBRIpjYa25xnzYHjZhUw0v5OXSIYmxiljIeI7K7k
 yJQFyCKJgcUJEKkEgtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160055
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=brian.cain@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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


On 10/15/2026 4:38 AM, Yonggang Luo wrote:
> On Thu, Oct 15, 2026 at 5:20 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>> On Thu, 15 Oct 2026 at 05:41, Yonggang Luo <luoyonggang@gmail.com> wrote:
>>> Put query-cpu-definitions, dump notes, monitor, and Angel semihosting on
>>> TargetOps[SYS_EMU_TARGET__MAX] and look up by target_arch().
>>> Keep the table in target-ops.c and with a stub
>>>
>>> - Register with a QEMU_ARCH_* bitmask so shared base-arch objects
>>>    can fill both slots (e.g. QEMU_ARCH_ARM is ARM|AARCH64).
>>> - TARGET_INFO_CPU_OP is type_init. A NULL member means no handler.
>>> - Drop stubs/qmp-cpu.c
>>>         stubs/hmp-cmd-info_tlb.c
>>>         stubs/hmp-cmd-info_mem.c
>>>         stubs/dump.c
>>>
>>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>>> ---
>>>   MAINTAINERS                           |  1 -
>>>   hw/core/cpu-system.c                  | 23 ++++++++++
>>>   hw/core/machine-qmp-cmds.c            | 27 ++++++++++++
>>>   include/qemu/target-ops.h             | 59 +++++++++++++++++++++++++
>>>   include/semihosting/common-semi.h     | 63 ++++++++++++++++++++++++---
>>>   meson.build                           |  1 +
>>>   monitor/hmp.c                         | 25 +++++++++++
>>>   stubs/dump.c                          | 27 ------------
>>>   stubs/hmp-cmd-info_mem.c              | 12 -----
>>>   stubs/hmp-cmd-info_tlb.c              | 12 -----
>>>   stubs/meson.build                     |  4 --
>>>   stubs/qmp-cpu.c                       | 21 ---------
>>>   target-ops.c                          | 49 +++++++++++++++++++++
>>>   target/arm/arch_dump.c                |  8 +++-
>>>   target/arm/arm-qmp-cmds.c             | 15 +++++--
>>>   target/arm/common-semi-target.c       | 26 ++++++++---
>>>   target/arm/meson.build                |  7 +--
>>>   target/hexagon/common-semi-target.c   | 26 ++++++++---
>>>   target/i386/arch_dump.c               |  8 +++-
>>>   target/i386/cpu-system.c              | 12 +++--
>>>   target/i386/cpu.c                     |  6 ++-
>>>   target/i386/monitor.c                 |  8 +++-
>>>   target/loongarch/arch_dump.c          |  8 +++-
>>>   target/loongarch/loongarch-qmp-cmds.c | 15 +++++--
>>>   target/m68k/monitor.c                 |  4 +-
>>>   target/mips/system/mips-qmp-cmds.c    | 15 +++----
>>>   target/ppc/arch_dump.c                |  8 +++-
>>>   target/ppc/monitor.c                  |  4 +-
>>>   target/ppc/ppc-qmp-cmds.c             | 15 +++----
>>>   target/riscv/arch_dump.c              |  8 +++-
>>>   target/riscv/common-semi-target.c     | 28 ++++++++----
>>>   target/riscv/meson.build              |  4 +-
>>>   target/riscv/monitor.c                |  4 +-
>>>   target/riscv/riscv-qmp-cmds.c         | 15 +++++--
>>>   target/s390x/arch_dump.c              |  8 +++-
>>>   target/s390x/cpu_models_system.c      | 15 +++++--
>>>   target/sh4/monitor.c                  |  4 +-
>>>   target/sparc/monitor.c                |  4 +-
>>>   target/xtensa/monitor.c               |  4 +-
>>>   39 files changed, 428 insertions(+), 175 deletions(-)
>>>   create mode 100644 include/qemu/target-ops.h
>>>   delete mode 100644 stubs/dump.c
>>>   delete mode 100644 stubs/hmp-cmd-info_mem.c
>>>   delete mode 100644 stubs/hmp-cmd-info_tlb.c
>>>   delete mode 100644 stubs/qmp-cpu.c
>>>   create mode 100644 target-ops.c
>> Too big a patch touching stuff all over the place with
>> insufficient explanation of what it's doing or why.
> Oh, sorry, I post is just for demo(DRAFT) for other place to
> reference, but git-publish have no way
> to title it(maybe because I use it wrongly).

git publish has `--subject-prefix=PREFIX` - that will let you qualify 
this as DRAFT/RFC.


>> thanks
>> -- PMM
>
>

