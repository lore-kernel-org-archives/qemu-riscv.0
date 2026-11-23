Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413BD606A31F
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 13:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uvv/apN1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J7XYDDES
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVUHh-0003kl-KQ; Mon, 23 Nov 2026 08:40:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVUHb-0003hf-VZ
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 08:40:37 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVUHZ-0003DU-KQ
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 08:40:35 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ANDL45D3072614
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 13:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S4q7mqd46LjCgGPWPaesCDlWvj+VzOK+/hpkAjTf4pU=; b=Uvv/apN1/cB/exiy
 ScG2jyv6Lw1OtCJHV1C3CRLVswqbkT5e7bk7b0s5tawAAE3q+eDpc09E7g8GyMT1
 K8soekjIVjuyrnictL75IEozn3RFmJ3vERVLu3h95wHMAlsZ5Tf5vfyjpv9B3P57
 4iSWDz8z81PjBMzMdg8VKLhw8Z8femSD6obLiRi805ZJvcMsYrUCtXb/JEdci6ZS
 Gnogr/nHCXjPZbXGtY+50YLkVzhy8Kd4v+jd8u5JgwNWxQv1MS7OR4qGwbOV6fwO
 L/u2gwVZV71+rTKqk96MNxTscF+nJAJN2KTWTFz4f3/FqI+XkNl6J2JwRQ7LkPpR
 JdY/mQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7s7mj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 13:40:32 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-92125693bc6so64796146d6.1
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 05:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795441232; x=1796046032; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=S4q7mqd46LjCgGPWPaesCDlWvj+VzOK+/hpkAjTf4pU=;
 b=J7XYDDES+o4hOmzD1X4ggVIrFL2OucoCW8+dAUhzSk+n2pmAfhQDDr+uSOOMfhX/+i
 cQ7+azGZ56OmoXFlMVcclMgpxCJzJ4A8BfgyyI4fICMj30NyCcVdYJ9kkVwF7dXHxT62
 9nc8PIuIn0s/eSRdgdj+Nezp/k+GmjV2D1sr/XM+uGevnpLKUSRMdk4AxNE01cPklL9x
 j7OCwnrk03E3+2uC3eskeAJvQsKpJx3dQtXYjQCJvyaTpcX5hi36WIygoUyGLBNKR8P+
 bRAMr74fhEnMKbjrboJTrfi4bPu1+Qvs2p/oF0OEd+16775Nj/elVmXiWL0AEHTaT71F
 /fUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795441232; x=1796046032;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=S4q7mqd46LjCgGPWPaesCDlWvj+VzOK+/hpkAjTf4pU=;
 b=yLK2FmQT7B/xsIBF+ggBTZsHs9VsURmRUCERDbZoyvB44lNYwNv/cs/wHQEmMiGKVY
 k+znP6dxj+BSQ9W4ZE4Doh8xNNlC5xIaSc8kEE8w9pErfFrYh6ibUgbev18Qr5c0a0jT
 Fm9To27vqiDho3fElst0kSp8BGIKTDZwIoxj3asUyzoUKL4p1gFLXOYXih7NEGZ4Rd9q
 Gn2Qjd8az0iNmi+s8olXwjO8b2pKv+ReLApw46WnNXAzT/QmsSbzd8w94fUyWi0/xsI/
 XKPHey05hTMvZUX7O+1OFtSgyG82Lm7/0rtqQIhsW1UcGdr3EIvbHslUJnO71LODj8gc
 Y7ag==
X-Forwarded-Encrypted: i=1;
 AL+hErF0v+++kBNGXj03TbWMYi+KwsDq1NDzT4W45W0sOQ4L5MgJHASRMmXrsyjgiqk0sCT1DR09Z19awhCa@nongnu.org
X-Gm-Message-State: APuU4Z82f12/LqgbKRQDo3zN0cIKMXfiF6T+5wXiVCt1RdxbSyPyPA0T
 tkvdWAGfNhvUvhtqMD6u/E/TemyQCiVOq4OAus+qsVa2Pbv536Ck99AAiiTgkhIqe4c7oly+4xQ
 YWqtYPZpohccILopfBHVB80z+3hOdnL/X8LgzZp0fN0/5Avysue1Swe4ppA==
X-Gm-Gg: AZFdTZefYyIqetgK66by6DOMDnSmVB11gUhaZc4NnokqlOzKWxH67QsaQ5jiAwnkBl5
 tLKZHjDEcjkSFTDwtR5Pj9lZxjbMgn3DNyap89BDQTRTUnuns7Hb8lXdvbWtl0R8YdL3p6/ZzG4
 guWzDWkhhDqCsm0+HjYvmhacKS9tGc8KJSHG/Ohi1fozYzEvtAgTu0N/9hS3vVjDbevoux1BjF/
 Wns9WNjzQ3P3d9YayTh1nJucJ4EdLQ9YYMUFCYeS7w9Dz7RuTHNUCVeUDgzmw6oHER15q8iEW/L
 y2asSvCZH17YDUMnyELc7uOfmI9rVzNT62paBnw6qxT1//aBMrDi/ueqBW4daIT6c6YfF/Fz1jI
 P8ciYL5GtfhWxJ9YbaTolBtH3WQOLIhnbfpGNiKpXdir9FSPygcK/okiJwwWmylI0ELRk6WGduz
 CZDPLsAYNa
X-Received: by 2002:a05:6214:3bc5:b0:91e:9ada:f270 with SMTP id
 6a1803df08f44-9212e1057e2mr262635226d6.27.1795441231685; 
 Mon, 23 Nov 2026 05:40:31 -0800 (PST)
X-Received: by 2002:a05:6214:3bc5:b0:91e:9ada:f270 with SMTP id
 6a1803df08f44-9212e1057e2mr262634486d6.27.1795441230844; 
 Mon, 23 Nov 2026 05:40:30 -0800 (PST)
Received: from [192.168.68.101] ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-921349ec64csm106376886d6.28.2026.11.23.05.40.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 05:40:30 -0800 (PST)
Message-ID: <5765954d-e262-47e6-89b9-3d34af6342ef@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 10:40:27 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] target/riscv: Fix icount trigger exception PC
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
References: <20261113084622.738278-1-himanshu.chauhan@oss.qualcomm.com>
 <20261113084622.738278-3-himanshu.chauhan@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261113084622.738278-3-himanshu.chauhan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b044250 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Xt3aY7vK3ztYvYV0jf0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NCBTYWx0ZWRfX311eTB6c4Urj
 G3muLFTD88WAoobloyo+lAVzDCzDE0fGhhosRI427FbD5od9i08LVUN/94B+w19EailSDH7FdHs
 d5pRpSX5aHxpCrLJPo19rJExh1W57NJDqdnE9a0gBzxLbnMCVL6a22fkGhJgs3SVQgcU9NzI0h8
 nqYQgRMNBhccjFrOzRtPO1ocvQ6oXFXuPLEYj0dd0qncagmeVP7XZLKspETigeHUsuEKF53wa8M
 9HsJkA5Jwsw1//Y+EN9jdNxf/XjD1Q5itYJZwrd9/ncymPlCkc5rZHcNDUp30Jox6NTmurnyz01
 DtTpg+xu/jMIQoJsdcrcTJK1H7q52SL03naACRSW/v8PGtIY9BOr6pBqHjRxgcSGkrSmgzPlgvh
 5tgEIfynEuWQzvJFABkTH/73lEMs7ZbXhcqY5p3kbwxlMFvlcAFMEJjEvO6lxF+r1H1i2S3ovGe
 GTSlY5QdnWAAJfH3q3g==
X-Proofpoint-GUID: 7CqXPigg35nk-5CbVnp8MP2QzuaM27nP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NCBTYWx0ZWRfX717U+ZqE6xLO
 pyoK9Y8bOHO3yfzoGJd+0tKpVlzXyrY7N24C3e+g3z1PsyKR0ILv2PKKc+1gSuF8k5tGulkp3rn
 zrv+rtAYvk3w3t1CLdEUTlQqW2r7ypc=
X-Proofpoint-ORIG-GUID: 7CqXPigg35nk-5CbVnp8MP2QzuaM27nP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230054
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



On 11/13/2026 5:46 AM, Himanshu Chauhan wrote:
> Per the Sdtrig specification, on a breakpoint exception with icount, xepc
> must contain the virtual address of the next instruction to execute so
> program flow is preserved. A one-instruction trigger must therefore fire
> only after the counted instruction retires, and xepc must contain the
> architectural successor PC: the branch target for a taken branch, or the
> fallthrough PC otherwise.
> 
> QEMU previously disabled the translated-block trigger flag when icount was
> enabled and relied on timer and privilege-change callbacks to update the
> count. That allowed the trigger to fire outside instruction retirement
> before the guest PC advanced, causing Linux to observe the old PC and
> re-enter the same breakpoint while single-stepping with icount.
> 
> Fix this by publishing the icount trigger flag in translated blocks even
> with icount enabled. The translated helper now decrements the trigger count
> after the instruction has committed its successor PC and raises the trigger
> action only then. Privilege-mode changes, context CSR writes and migration
> post-load refresh the cached enabled state because icount trigger matching
> depends on the current mode and context.
> 
> Remove the old itrigger timers because instruction counting is now tied
> to translated instruction retirement instead of virtual-time callbacks.
> 
> Fixes: 5a4ae64cac49 ("target/riscv: Add itrigger support when icount is enabled")
> Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.h            |   5 +-
>   target/riscv/machine.c        |   5 +-
>   target/riscv/tcg/cpu_helper.c |  10 +--
>   target/riscv/tcg/csr.c        |   3 +
>   target/riscv/tcg/debug.c      | 121 +++++-----------------------------
>   target/riscv/tcg/tcg-cpu.c    |   7 +-
>   6 files changed, 33 insertions(+), 118 deletions(-)
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
> index 2067657c81..a84d8eb4cf 100644
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
> @@ -768,21 +766,6 @@ itrigger_set_pending(CPURISCVState *env, int index, int val)
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
> @@ -790,7 +773,7 @@ bool riscv_itrigger_enabled(CPURISCVState *env)
>           if (get_trigger_type(env, i) != TRIGGER_TYPE_INST_CNT) {
>               continue;
>           }
> -        if (check_itrigger_priv(env, i)) {
> +        if (!trigger_common_match(env, TRIGGER_TYPE_INST_CNT, i)) {
>               continue;
>           }
>           count = itrigger_get_count(env, i);
> @@ -817,7 +800,12 @@ void HELPER(itrigger_match)(CPURISCVState *env)
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
> @@ -832,6 +820,9 @@ void HELPER(itrigger_match)(CPURISCVState *env)
>                *
>                * Note that itrigger_set_pending() is a no-op if we're
>                * running debug 0.13.
> +             *
> +             * Software writes still validate pending as a read-only field;
> +             * QEMU only toggles it internally around the trigger action.
>                */
>               itrigger_set_pending(env, i, 1);
>   
> @@ -844,53 +835,13 @@ void HELPER(itrigger_match)(CPURISCVState *env)
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
> @@ -925,18 +876,10 @@ static void itrigger_reg_write(CPURISCVState *env, target_ulong index,
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
> @@ -945,33 +888,17 @@ static void itrigger_reg_write(CPURISCVState *env, target_ulong index,
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
> @@ -1163,8 +1090,6 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
>   
>   void riscv_trigger_realize(CPURISCVState *env)
>   {
> -    int i;
> -
>       if (env->num_triggers > RV_MAX_TRIGGERS) {
>           error_report(
>                   "Invalid configuration: 'num-triggers' must be less than %u",
> @@ -1177,12 +1102,6 @@ void riscv_trigger_realize(CPURISCVState *env)
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
> @@ -1193,11 +1112,6 @@ void riscv_trigger_unrealize(CPURISCVState *env)
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
> @@ -1225,7 +1139,6 @@ void riscv_trigger_reset_hold(CPURISCVState *env)
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


