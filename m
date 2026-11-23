Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16BE606A31E
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 13:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pf7RxGId;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=My336aro
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVTmD-00013v-NZ; Mon, 23 Nov 2026 08:08:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVTlt-0000w7-RD
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 08:07:52 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVTlr-0003qV-2n
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 08:07:49 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ANCFwKt2928059
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 13:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oCDJEP9DC2sEzbV9n53YxHXO2CXIe10TvF3XCPNJue0=; b=pf7RxGIdg3WRSOzj
 JHj/f++jqTRNNKBlDIy8bPcnVebSq9BRpj7OCfGGRIenLZmgIbyQpv9vuP7e2X/L
 SXhQRfZSX8tw4/5P7YUi3HtfRna+k7aNyE+U0mdBHx7CXMqF9FUR/ZKD7n/kG1X0
 n6bQ3KDsxp8XRhqR1rV4dimrJfqwqL2qEeAg9sKhx6MfmfoX7tUBSFREKrvXVjaI
 emisAP45Fp05PBnIwRXh9cWPNpU53PpkkmiXkd7K93iKYtRdW/+BnaLndDqA+3TD
 iKr62VMMw6TI5fb/UV6KpgIEZ6cWMZzbJH439RlrtvNWKDydpWb8FiGNeMd4qWc+
 ZSx3Iw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7s432-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 13:07:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-53661e036a2so64203491cf.1
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 05:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795439265; x=1796044065; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=oCDJEP9DC2sEzbV9n53YxHXO2CXIe10TvF3XCPNJue0=;
 b=My336aroaYMp2yjNtuimrXpc7NJx2dUyOJ+k5B3FwryxKm/9YZ2rMlFYx6oVJ6UnmJ
 gX0MDbysrSQT4bvSxj26GAWuqHftN/9fDLh6eACNH4CTp6JBHZmdbt07kwYPbqSSbzJH
 9Zq3k5wDdj5CQPUpJVyU9lcGjMLsgNQ6x/Bf/CGxVtOj39c0X0uF4sJv9SC0SmzkOVOv
 ICBaikFlUzOzhN7RdVfsMWbFMDvyvIl9kMvrFpCdsPMu8pO+nBkZpLJBiDTgOS5TPBRo
 l2vrQX65t5ifpVOR0b9FEbMuhVAiP8q3ne7LB03hKlEbM0NTkCY+2vk5I/074bE6nuKq
 arlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795439265; x=1796044065;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=oCDJEP9DC2sEzbV9n53YxHXO2CXIe10TvF3XCPNJue0=;
 b=obkPeTdjr9l14JgFkSI2oXWQOSi0nl6QqNhPscvNzSR0RznhSH7Ptb+2VMm90V/kF6
 5hfoeZg0AUaFWQ2CussPyQM+myb4I+Ogm5v/0ONVv/WOHnmtLfZEF95rI5EXyIUXJR1u
 vWyGcGHyeeST8PDf9KDJmDauTI+ltKrP+/9gWOKWdUFjLj6E7/fW5MV+11zabbTauNfK
 63vVoJH796UJaXlD+H6STMx8vNBptIEaAf9zcQbleCiAGwuCcp3ZduaMsN/3yLgBYUGS
 9txlFzUhBigQ7V3lNpriUWwWSXeG4EgdhyUsqSuBURVl/v9F/pPWqyyuWXJB9DIAk53/
 WudQ==
X-Forwarded-Encrypted: i=1;
 AL+hErGfjfyXC6ijQC5Jc5FTUFifqPs3gWFrP2245l7SdXIE2nE9knHt/pOUl4/p4+zbkFvCme2NE1Z5+7iM@nongnu.org
X-Gm-Message-State: APuU4Z9O14cF2Tn/PkYJXp/5dxt11Hds8h6hZN8mnri9UAFNvTOjkxyC
 pAs+ICs7NGDzKUPEqJBpnDorH64E4ab6Xp7jN7DIuP0DI/FC70pdl7GctAvv9ZJtmTYCHWXmlOQ
 giglXjeSI3gPWbCJpVFkpJX1ytcaiDHlZxdrIYqXkKlUhhQ+JcTkNyI7xrQ==
X-Gm-Gg: AZFdTZcW1YYfuUNivZ/HbKVP3MbQQI9QJpjPwXGhoY9nw8NInD4ehflV3s/HwfWJH+3
 4kU47XLn5LquHg7nyJhuIbaWMN1RcnyoIen8pbTwmFGsg+pOxf2DPlezVrshPpLymdnhRDkplR8
 fQt2V/KksFjLjKPP7OsVOFNErs5f5vV7bhFYbe+w8NJXbZSss43LVGDf9OHrzywzbLBCschiAum
 K6qCQ4vV+kC156oHxEUvJXzePT1itARWZkk26FzN/SfmWsexShTZaBIfbQI1D782RlES5A8j46r
 A9jIIhqiQCevSWq0bV+gMoleOGtb7Lyjx9XbUAJ7gnAuB8dXcRuvz8SqYzlConkq7A0mV0uZitE
 kBmYm8QLTGyERM6O+CNSULjyCcH86uayqT79UTEr84HzLS3Ttk7nGbhQ8qhDKFWbl1VVdMGvseo
 RRoeSWUAFG
X-Received: by 2002:a05:622a:a881:b0:55d:324d:7992 with SMTP id
 d75a77b69052e-55d76b3267cmr206853981cf.67.1795439264369; 
 Mon, 23 Nov 2026 05:07:44 -0800 (PST)
X-Received: by 2002:a05:622a:a881:b0:55d:324d:7992 with SMTP id
 d75a77b69052e-55d76b3267cmr206853251cf.67.1795439263711; 
 Mon, 23 Nov 2026 05:07:43 -0800 (PST)
Received: from [192.168.68.101] ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-55d7887b610sm96771621cf.23.2026.11.23.05.07.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 05:07:43 -0800 (PST)
Message-ID: <4a74a671-1331-43b6-af15-7616a7b2e34f@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 10:07:40 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] target/riscv: Fix icount trigger exception PC
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
References: <20261111133411.1922854-1-himanshu.chauhan@oss.qualcomm.com>
 <20261111133411.1922854-2-himanshu.chauhan@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111133411.1922854-2-himanshu.chauhan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b043aa1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7mntF2VWuiWZdo-PUeoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MiBTYWx0ZWRfX2pTTacoMvmK0
 U/LfAS+AEdrmz4j1it5u0GQO0MTpFb9rvQrmuZs1YCdsR1VjrqOqK8LydFmKPeDnACyk59cE9Eg
 cG8KNr0rOUtiECna9e/tlZ6jLYDx4HZOEKrUYqcFbHYvu2cfCtmpXS0lKSNeporPr1K44SZAMJd
 8dpobUSpAUcvd0FMxpuZhO7y3C1lKMT+88XBXGjQjUqn/729LXviGR8tj5O6uYg6/cnvPMByZqz
 alPWPI3i/PIv70DbTx18CNfzpK1+Wx/i3OgqsI3gNyv0RueG42ExUpsmKYMngQDDN5umxotFSu/
 UG+Mbs08waUr+8srJEyNlwXbMyGJaRNgTZCyOqI2kLCBOv7D+6dbRHnag7x1y/gY6sWbaWSKNHJ
 hltXQIl+Q+jK7zB64wZiq4/1a3e0hNE0Fy8KF5CeGVdrNAL2HKBHjZRg+qN2THYSCyeZXTjJcCJ
 D5RLBHLf0Oe0CVqzXNA==
X-Proofpoint-GUID: YuOYA0WtYKvU3eEzIGiKoQBGwZ0ec4El
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MiBTYWx0ZWRfX77ZdxZZYstnr
 EMyI7uB6MW4l3bGTWEKVjfr9vQyzjFzZbNQswUKSPm0/ZVUHPIc6IZr6CH6MmmmyYg2g04aRBGw
 LTuQXNmmb/asgaPMbcqERRS4NBU+s2Q=
X-Proofpoint-ORIG-GUID: YuOYA0WtYKvU3eEzIGiKoQBGwZ0ec4El
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230052
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 11/11/2026 10:34 AM, Himanshu Chauhan wrote:
> Per the Sdtrig specification, on a breakpoint exception with icount, the
> xepc must contain the virtual address of the next instruction that must
> be executed to preserve the program flow. So for a one-instruction
> trigger must fire only after the counted instruction retires. The xepc
> must contains the architectural successor PC which for a taken branch
> should be the branch target and the fallthrough otherwise.
> 
> QEMU previously disabled the translated-block trigger flag when icount was
> enabled and relied on timer and privilege-change callbacks to update the
> count, so the trigger could fire outside instruction retirement before the
> guest PC advanced, causing Linux to observe the old PC and re-enter the same
> breakpoint while single-stepping with icount.
> 
> Fix this by
>    - publishing the icount trigger flag in translated blocks even with
>      icount enabled
>    - making the helper decrement the trigger count after the
>      instruction has committed its successor PC and raise the trigger
>      action only then
>    - privilege-change callbacks refresh cached enabled state because itriggers
>      tied to privilege mode.
> 
> Also make trigger data CSR availability depend on an implemented trigger slot
> rather than the currently selected trigger type, so software can disable a
> trigger with type zero and still write the rest of the slot state before
> selecting another supported type.
> 
> itrigger timers are completely removed as they are not required now.
> 
> Fixes: 5a4ae64cac49 ("target/riscv: Add itrigger support when icount is enabled")
> Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.h            |   5 +-
>   target/riscv/machine.c        |   5 +-
>   target/riscv/tcg/cpu_helper.c |  10 +-
>   target/riscv/tcg/csr.c        |   3 +
>   target/riscv/tcg/debug.c      | 170 ++++++++++------------------------
>   target/riscv/tcg/tcg-cpu.c    |   7 +-
>   6 files changed, 64 insertions(+), 136 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 49a1186bdb..3109d71470 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -484,8 +484,7 @@ struct CPUArchState {
>       uint8_t trigger_cur;
>       /*
>        * num_triggers is the length of tdata1, tdata2, tdata3,
> -     * cpu_breakpoint, cpu_watchpoint and itrigger_timer
> -     * arrays.
> +     * cpu_breakpoint and cpu_watchpoint arrays.
>        */
>       uint32_t num_triggers;
>       uint64_t *tdata1;
> @@ -493,8 +492,6 @@ struct CPUArchState {
>       uint64_t *tdata3;
>       struct CPUBreakpoint **cpu_breakpoint;
>       struct CPUWatchpoint **cpu_watchpoint;
> -    QEMUTimer **itrigger_timer;
> -    int64_t last_icount;
>       bool itrigger_enabled;
>   
>       /* machine specific rdtime callback */
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 0de06e9588..74176e7c6e 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -22,7 +22,6 @@
>   #include "system/kvm.h"
>   #include "system/tcg.h"
>   #include "migration/cpu.h"
> -#include "exec/icount.h"
>   #include "target/riscv/tcg/debug.h"
>   #ifdef CONFIG_KVM
>   #include "kvm/kvm_riscv.h"
> @@ -339,9 +338,7 @@ static int debug_post_load(void *opaque, int version_id)
>       RISCVCPU *cpu = opaque;
>       CPURISCVState *env = &cpu->env;
>   
> -    if (icount_enabled()) {
> -        env->itrigger_enabled = riscv_itrigger_enabled(env);
> -    }
> +    env->itrigger_enabled = riscv_itrigger_enabled(env);
>   
>       return 0;
>   }
> diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
> index 58e98e975c..0375b930be 100644
> --- a/target/riscv/tcg/cpu_helper.c
> +++ b/target/riscv/tcg/cpu_helper.c
> @@ -940,10 +940,6 @@ void riscv_cpu_set_mode(CPURISCVState *env, privilege_mode_t newpriv,
>       g_assert(newpriv <= PRV_M && newpriv != PRV_RESERVED);
>   
>       if (newpriv != env->priv || env->virt_enabled != virt_en) {
> -        if (icount_enabled()) {
> -            riscv_itrigger_update_priv(env);
> -        }
> -
>           riscv_pmu_update_fixed_ctrs(env, newpriv, virt_en);
>       }
>   
> @@ -982,6 +978,12 @@ void riscv_cpu_set_mode(CPURISCVState *env, privilege_mode_t newpriv,
>               riscv_cpu_interrupt(env);
>           }
>       }
> +
> +    /*
> +     * Icount triggers are scoped by U/S/M and VU/VS mode bits.  Refresh the
> +     * cached translated-block flag after privilege or virtualization changes.
> +     */
> +    riscv_itrigger_update_priv(env);
>   }
>   
>   /*
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index af444e3e6f..7c05c866fd 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -5732,6 +5732,9 @@ static RISCVException write_mcontext(CPURISCVState *env, int csrno,
>       }
>   
>       env->mcontext = val & mask;
> +#if !defined(CONFIG_USER_ONLY)
> +    env->itrigger_enabled = riscv_itrigger_enabled(env);
> +#endif
>       return RISCV_EXCP_NONE;
>   }
>   
> diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
> index 8b58cbd07a..53b1e41f6c 100644
> --- a/target/riscv/tcg/debug.c
> +++ b/target/riscv/tcg/debug.c
> @@ -32,8 +32,6 @@
>   #include "trace.h"
>   #include "exec/helper-proto.h"
>   #include "exec/watchpoint.h"
> -#include "system/cpu-timers.h"
> -#include "exec/icount.h"
>   #include "accel/tcg/cpu-loop.h"
>   
>   /*
> @@ -53,20 +51,6 @@
>    *     1 |    2 |         tdata1, tdata2 | Address / Data Match
>    */
>   
> -/* tdata availability of a trigger */
> -typedef bool tdata_avail[TDATA_NUM];
> -
> -static tdata_avail tdata_mapping[TRIGGER_TYPE_NUM] = {
> -    [TRIGGER_TYPE_NO_EXIST] = { false, false, false },
> -    [TRIGGER_TYPE_AD_MATCH] = { true, true, true },
> -    [TRIGGER_TYPE_INST_CNT] = { true, false, true },
> -    [TRIGGER_TYPE_INT] = { true, true, true },
> -    [TRIGGER_TYPE_EXCP] = { true, true, true },
> -    [TRIGGER_TYPE_AD_MATCH6] = { true, true, true },
> -    [TRIGGER_TYPE_EXT_SRC] = { true, false, false },
> -    [TRIGGER_TYPE_UNAVAIL] = { true, true, true }
> -};
> -
>   /* only breakpoint size 1/2/4/8 supported */
>   static int access_size[SIZE_NUM] = {
>       [SIZE_ANY] = 0,
> @@ -165,13 +149,17 @@ static inline target_ulong build_tdata1(CPURISCVState *env,
>   
>   bool tdata_available(CPURISCVState *env, int tdata_index)
>   {
> -    int trigger_type = get_trigger_type(env, env->trigger_cur);
> -
>       if (unlikely(tdata_index >= TDATA_NUM)) {
>           return false;
>       }
>   
> -    return tdata_mapping[trigger_type][tdata_index];
> +    /*
> +     * tdata CSRs belong to the trigger slot, not to the currently selected
> +     * trigger type.  A type-zero trigger is disabled, but the slot still
> +     * exists, so software must still be able to write tdata2/tdata3 before
> +     * selecting a supported trigger type.
> +     */
> +    return env->trigger_cur < env->num_triggers;
>   }
>   
>   target_ulong tselect_csr_read(CPURISCVState *env)
> @@ -729,6 +717,30 @@ static void type6_reg_write(CPURISCVState *env, target_ulong index,
>       }
>   }
>   
> +static void no_trigger_reg_write(CPURISCVState *env, target_ulong index,
> +                                 int tdata_index, target_ulong val)
> +{
> +    /*
> +     * OpenSBI programs DBTR slots by first writing type zero to tdata1, then
> +     * writing tdata2/tdata3, and finally writing the desired trigger type.
> +     */
> +    switch (tdata_index) {
> +    case TDATA1:
> +        type2_breakpoint_remove(env, index);
> +        env->tdata1[index] = 0;
> +        env->itrigger_enabled = riscv_itrigger_enabled(env);
> +        break;
> +    case TDATA2:
> +        env->tdata2[index] = val;
> +        break;
> +    case TDATA3:
> +        env->tdata3[index] = textra_validate(env, val);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
>   /* icount trigger type */
>   static inline int
>   itrigger_get_count(CPURISCVState *env, int index)
> @@ -754,21 +766,6 @@ itrigger_set_pending(CPURISCVState *env, int index, int val)
>                                      ITRIGGER_PENDING, val);
>   }
>   
> -static bool check_itrigger_priv(CPURISCVState *env, int index)
> -{
> -    target_ulong tdata1 = env->tdata1[index];
> -    if (env->virt_enabled) {
> -        /* check VU/VS bit against current privilege level */
> -        return (get_field(tdata1, ITRIGGER_VS) == env->priv) ||
> -               (get_field(tdata1, ITRIGGER_VU) == env->priv);
> -    } else {
> -        /* check U/S/M bit against current privilege level */
> -        return (get_field(tdata1, ITRIGGER_M) == env->priv) ||
> -               (get_field(tdata1, ITRIGGER_S) == env->priv) ||
> -               (get_field(tdata1, ITRIGGER_U) == env->priv);
> -    }
> -}
> -
>   bool riscv_itrigger_enabled(CPURISCVState *env)
>   {
>       int count;
> @@ -776,7 +773,7 @@ bool riscv_itrigger_enabled(CPURISCVState *env)
>           if (get_trigger_type(env, i) != TRIGGER_TYPE_INST_CNT) {
>               continue;
>           }
> -        if (check_itrigger_priv(env, i)) {
> +        if (!trigger_common_match(env, TRIGGER_TYPE_INST_CNT, i)) {
>               continue;
>           }
>           count = itrigger_get_count(env, i);
> @@ -803,7 +800,12 @@ void HELPER(itrigger_match)(CPURISCVState *env)
>           if (!count) {
>               continue;
>           }
> -        itrigger_set_count(env, i, count--);
> +        /*
> +         * This helper is emitted at TB exit after one guest instruction and
> +         * after the translator has committed env->pc to the successor PC.
> +         */
> +        count--;
> +        itrigger_set_count(env, i, count);
>           if (!count) {
>               /*
>                * From the 1.0 spec: "When pending is set, the trigger
> @@ -822,61 +824,21 @@ void HELPER(itrigger_match)(CPURISCVState *env)
>               itrigger_set_pending(env, i, 1);
>   
>               env->itrigger_enabled = riscv_itrigger_enabled(env);
> -            do_trigger_action(env, i);
>               itrigger_set_pending(env, i, 0);
> +            do_trigger_action(env, i);
>           }
>       }
>   }
>   
>   static void riscv_itrigger_update_count(CPURISCVState *env)
>   {
> -    int count, executed;
>       /*
> -     * Record last icount, so that we can evaluate the executed instructions
> -     * since last privilege mode change or timer expire.
> +     * Icount triggers are matched from translated code after an instruction
> +     * has committed its successor PC.  Timer and privilege-change callbacks
> +     * therefore must not decrement count or fire the action here; they only
> +     * refresh the cached TB flag state.
>        */
> -    int64_t last_icount = env->last_icount, current_icount;
> -    current_icount = env->last_icount = icount_get_raw();
> -
> -    for (int i = 0; i < env->num_triggers; i++) {
> -        if (get_trigger_type(env, i) != TRIGGER_TYPE_INST_CNT) {
> -            continue;
> -        }
> -        count = itrigger_get_count(env, i);
> -        if (!count) {
> -            continue;
> -        }
> -        /*
> -         * Only when privilege is changed or itrigger timer expires,
> -         * the count field in itrigger tdata1 register is updated.
> -         * And the count field in itrigger only contains remaining value.
> -         */
> -        if (check_itrigger_priv(env, i)) {
> -            /*
> -             * If itrigger enabled in this privilege mode, the number of
> -             * executed instructions since last privilege change
> -             * should be reduced from current itrigger count.
> -             */
> -            executed = current_icount - last_icount;
> -            itrigger_set_count(env, i, count - executed);
> -            if (count == executed) {
> -                do_trigger_action(env, i);
> -            }
> -        } else {
> -            /*
> -             * If itrigger is not enabled in this privilege mode,
> -             * the number of executed instructions will be discard and
> -             * the count field in itrigger will not change.
> -             */
> -            timer_mod(env->itrigger_timer[i],
> -                      current_icount + count);
> -        }
> -    }
> -}
> -
> -static void riscv_itrigger_timer_cb(void *opaque)
> -{
> -    riscv_itrigger_update_count((CPURISCVState *)opaque);
> +    env->itrigger_enabled = riscv_itrigger_enabled(env);
>   }
>   
>   void riscv_itrigger_update_priv(CPURISCVState *env)
> @@ -911,18 +873,10 @@ static void itrigger_reg_write(CPURISCVState *env, target_ulong index,
>   
>       switch (tdata_index) {
>       case TDATA1:
> -        /* set timer for icount */
>           new_val = itrigger_validate(env, val);
>           if (new_val != env->tdata1[index]) {
>               env->tdata1[index] = new_val;
> -            if (icount_enabled()) {
> -                env->last_icount = icount_get_raw();
> -                /* set the count to timer */
> -                timer_mod(env->itrigger_timer[index],
> -                          env->last_icount + itrigger_get_count(env, index));
> -            } else {
> -                env->itrigger_enabled = riscv_itrigger_enabled(env);
> -            }
> +            env->itrigger_enabled = riscv_itrigger_enabled(env);
>           }
>           break;
>       case TDATA2:
> @@ -931,33 +885,17 @@ static void itrigger_reg_write(CPURISCVState *env, target_ulong index,
>           break;
>       case TDATA3:
>           env->tdata3[index] = textra_validate(env, val);
> +        env->itrigger_enabled = riscv_itrigger_enabled(env);
>           break;
>       default:
>           g_assert_not_reached();
>       }
>   }
>   
> -static int itrigger_get_adjust_count(CPURISCVState *env)
> -{
> -    int count = itrigger_get_count(env, env->trigger_cur), executed;
> -    if ((count != 0) && check_itrigger_priv(env, env->trigger_cur)) {
> -        executed = icount_get_raw() - env->last_icount;
> -        count += executed;
> -    }
> -    return count;
> -}
> -
>   target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
>   {
> -    int trigger_type;
>       switch (tdata_index) {
>       case TDATA1:
> -        trigger_type = extract_trigger_type(env,
> -                                            env->tdata1[env->trigger_cur]);
> -        if ((trigger_type == TRIGGER_TYPE_INST_CNT) && icount_enabled()) {
> -            return deposit64(env->tdata1[env->trigger_cur], 10, 14,
> -                             itrigger_get_adjust_count(env));
> -        }
>           return env->tdata1[env->trigger_cur];
>       case TDATA2:
>           return env->tdata2[env->trigger_cur];
> @@ -995,6 +933,8 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
>                         trigger_type);
>           break;
>       case TRIGGER_TYPE_NO_EXIST:
> +        no_trigger_reg_write(env, env->trigger_cur, tdata_index, val);
> +        break;
>       case TRIGGER_TYPE_UNAVAIL:
>           qemu_log_mask(LOG_GUEST_ERROR, "trigger type: %d does not exit\n",
>                         trigger_type);
> @@ -1147,8 +1087,6 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
>   
>   void riscv_trigger_realize(CPURISCVState *env)
>   {
> -    int i;
> -
>       if (env->num_triggers > RV_MAX_TRIGGERS) {
>           error_report(
>                   "Invalid configuration: 'num-triggers' must be less than %u",
> @@ -1161,12 +1099,6 @@ void riscv_trigger_realize(CPURISCVState *env)
>       env->tdata3 = g_new0(uint64_t, env->num_triggers);
>       env->cpu_breakpoint = g_new0(struct CPUBreakpoint *, env->num_triggers);
>       env->cpu_watchpoint = g_new0(struct CPUWatchpoint *, env->num_triggers);
> -    env->itrigger_timer = g_new0(QEMUTimer *, env->num_triggers);
> -
> -    for (i = 0; i < env->num_triggers; i++) {
> -        env->itrigger_timer[i] = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> -                                              riscv_itrigger_timer_cb, env);
> -    }
>   }
>   
>   void riscv_trigger_unrealize(CPURISCVState *env)
> @@ -1177,11 +1109,6 @@ void riscv_trigger_unrealize(CPURISCVState *env)
>   
>       g_free(env->cpu_breakpoint);
>       g_free(env->cpu_watchpoint);
> -
> -    for (int i = 0; i < env->num_triggers; i++) {
> -        timer_free(env->itrigger_timer[i]);
> -    }
> -    g_free(env->itrigger_timer);
>   }
>   
>   void riscv_trigger_reset_hold(CPURISCVState *env)
> @@ -1209,7 +1136,6 @@ void riscv_trigger_reset_hold(CPURISCVState *env)
>           env->tdata3[i] = 0;
>           env->cpu_breakpoint[i] = NULL;
>           env->cpu_watchpoint[i] = NULL;
> -        timer_del(env->itrigger_timer[i]);
>       }
>   
>       env->mcontext = 0;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 5834ec1524..027fe5b46a 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -181,8 +181,11 @@ static TCGTBCPUState riscv_get_tb_cpu_state(CPUState *cs)
>                ? EXT_STATUS_DIRTY : EXT_STATUS_DISABLED;
>       }
>   
> -    if ((cpu->cfg.debug || cpu->cfg.ext_sdtrig)
> -        && !icount_enabled()) {
> +    /*
> +     * Publish itrigger state even when QEMU icount is enabled.  The helper
> +     * runs from translated code after committing the guest successor PC.
> +     */
> +    if (cpu->cfg.debug || cpu->cfg.ext_sdtrig) {
>           flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
>       }
>   #endif


