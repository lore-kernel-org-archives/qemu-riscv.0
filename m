Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2092606A31E
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 17:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ugt46Wlv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DRN3twZx
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVuTh-000848-AE; Tue, 24 Nov 2026 12:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVuTR-0007xP-6d
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 12:38:33 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVuTN-0007ei-GW
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 12:38:32 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AOHPCSf980163
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 17:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ypQZhGOID9kvYSKvA3WyPN+AtwPytsxb9eTxQgf/PtU=; b=Ugt46WlvGtQ05eqj
 zGtUk/ypY8vxRfQkG1ti8LsXui9nd/Mtn//D5U6IXm2nWKQBn27u1NbtBR57QqCG
 KKCvBnAGnGrcfmaDVC3+g33QUl485QCydeBr0qMkIbrZ4BM4euIjGZk/zKUcbEnL
 ULNEPh6SgNTCqDdAMtmTWCM51nKoKSJoHk+OniTQLxXMY4czv8zwS7hEHHbFwAfO
 mQcHd4GbYYkrJDZq11xvBq3wNRBBgkMwojlH5IvA/xZqKwWVlGlr5aPVU1iIYruv
 NFPUMKxSxFcOKZuTilVV7clVCNHd7bPUJ6pVZ2XL4V0ul7EIcejp+p4PgVtOXvIj
 SR4fkQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eyd81yn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 17:38:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-921273a6cacso70974936d6.0
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 09:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795541906; x=1796146706; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ypQZhGOID9kvYSKvA3WyPN+AtwPytsxb9eTxQgf/PtU=;
 b=DRN3twZxsUePgYCHVt8uNd08rqusM8EZv6OMwvBWEtjxzu1RufEprdDu8Z28YaPohx
 Ps7dzfy6Aik8keyKYCXIwHx7rNtSY6J8wPa+wJ93MBm38sHUkl9c9XR6AjiAZRZHc4fr
 oHrEuSz7SFZz6ZfFHCHenYguLqY3DTE7fS9fceNnNsLL6mwmHpC/zs3WHmPXlAJ35QyR
 nLuSeh2bg6G7f38wzf4DqjGvdbSIBtQ1X8Bonv+9/i69Q5S/FeBbDrCWiHbjPRbBXsGg
 UNfS3qiO1xZmrHpmegFRYlbDFlkFn7eJFYHSw6K26Ibmd5uhDpOqdC45UlMvuwPzGCyM
 P1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795541906; x=1796146706;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ypQZhGOID9kvYSKvA3WyPN+AtwPytsxb9eTxQgf/PtU=;
 b=w0Sin+cpyxM87rtsqs//YOmROkEig1e6NeEhebM1+fPLVMR7P5UeDqYicKHFoy0lO2
 O6caJ0SloM5HowobL0i30WL5PXI3g5+EAQq0TpXdrx4fjW0ZE9ZnArQeKjPvTLsh1gh1
 ujSJrb3GFAqrLcaPsjPn6cHe4279aZEcbkuWRGCYLNmW+pjkLpIspUSqYNAwCCTpwsa7
 4Yz0rUzRomr29AREew6LFY78Aeg5sVNQkFUgtTMH7U/LsZjuKoJ9F3zZi+mpXEIn5VCF
 tNM/y5Hm5UoawJPE71Oa3PDzK97QLyFswazVbYK8ZMKH6ni1R6cw/H7UKFXaBZ42lH7c
 u8fA==
X-Gm-Message-State: APuU4Z9/uhlG4UXf4yR7b/rSwhxThS2DTcflDco0mkkWXMDBuOKhfX/f
 lf2ufWj2in4f0zvKdun+F3WJS3MqaGXWhyDOi3+sVR0nOLOvv1V5j2D33+JRAC9BnmXx8afld4E
 ykUo2nslRxr8e211a4ifMBPx24tBBxZ1uNPinm+YCaSsxSnNDRvNo/SpbmQ==
X-Gm-Gg: AZFdTZf5e/+UsiCwkt+GhY1BAumT2BSTb4tcmewjqUzQ/SQG8ilIOJUIVEv0YnkThSz
 dK12NuSbGNuUYQ5sVddrs4BEfUlYnw44z9HONp7FRqSsQabYfGb/xF0Ltx0WLbZNkBhPBgTSpIf
 jN4d4ggMvom+KQlUQQ3YDkrngcvKnr2FZoKqjD9lGBV+TeKSGs/loWg3bhJlC6i60/84tWKSH44
 sV/f8q1NwX/TqBVPitq9HXSeTUtJU972FDTUVs+7ouGJeZtOy4EhqwLZ4h/7ekXB+dnhq6rWotQ
 IQROf7RMhN7aWwGhNHiMBRGSD8C4T/BHYApkF5VuoYdHNoLpMVGGRlzio2hH5QvkCte5/OTqUif
 Dw5GNy2kl2+2TAJ1LGYSQJsw4x7JxMCRQl8+VQoosnSeE6NDR/JN97LwzjeRDphQp3kHILvXFsY
 c0L3N4FgVv
X-Received: by 2002:a05:6214:ca3:b0:921:2ea7:e42e with SMTP id
 6a1803df08f44-9214820f61cmr204767076d6.41.1795541905861; 
 Tue, 24 Nov 2026 09:38:25 -0800 (PST)
X-Received: by 2002:a05:6214:ca3:b0:921:2ea7:e42e with SMTP id
 6a1803df08f44-9214820f61cmr204766406d6.41.1795541905282; 
 Tue, 24 Nov 2026 09:38:25 -0800 (PST)
Received: from [192.168.68.101] ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-921349b2af5sm141593486d6.11.2026.11.24.09.38.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 09:38:24 -0800 (PST)
Message-ID: <ac5995d4-d1a7-4219-aa3f-0587e9f1ea35@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:38:22 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] target/riscv: Rebuild cached TB flags at state changes
To: SeungJu Cheon <suunj1331@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20261119164438.193579-1-suunj1331@gmail.com>
 <20261119164438.193579-3-suunj1331@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261119164438.193579-3-suunj1331@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX1xsgeL9rTJQL
 a4rQsTmlFAw/OtOJXkWzqv8bUKulpjXoYPFGXEXKQifv1IH8mt90nDNUNDNJIcj/D6HYAAMS2DX
 +h2VMo+gc68E4qlOKMRzqsDXk70JKfY=
X-Proofpoint-ORIG-GUID: KCD9jAiFpVg1tS6GEeHO8bBdzHUAbk0Z
X-Proofpoint-GUID: KCD9jAiFpVg1tS6GEeHO8bBdzHUAbk0Z
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b05cb93 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=XV2jNURMxb8a5ESxF98A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX6ISu6amJVMbe
 5VsSwoP1YPeW7UPk56HaV8jB+NLrckJpqLAy34mFC953Xz4t64c9C4lefZ3VDz9U5/sVGxAivkl
 UuMxsQfnJqrMBIgTQ3pigLS1+YiE017AlasTT/jV/vYUPUpBYMkXcLRCTCMizNcrdW3R82QkLte
 Lnbxurnl0WUFxqzaojqDjidZpQ0Jhw2VBAVVtfAryfhsvwiF7Itgr401GuJG/Tbz+wLqFgkaWgN
 7dWjQYBd2TF36e+jTNzOOVnE4nnJjHmGP2pEBq6a94OPwKB94Wxpm4OIJ51qM2XXXXUbWVvd3XJ
 WMUpGzxsuKufcfheKbsen27wd/csbrMwkm4E24ZwXQhFZI5Y09CShixCDIl0zqrdKjDJi0vm714
 zxTRLftRBr4BH4MqTADBDOcC1smqG92EgipfqhS94qFN1UZtbMxQCXnlI3VMyNFBOeu2NjFInP6
 2urAOlObwMyv5t7OGlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240069
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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



On 11/19/2026 1:44 PM, SeungJu Cheon wrote:
> Add tb_flags_cached, ext_tb_flags_cached and vlmax_cached to
> CPURISCVState and riscv_rebuild_tb_flags() to fill them. Call it
> where the inputs of riscv_compute_tb_flags() change: CSR writes,
> riscv_cpu_set_mode() (trap entry, xRET and debug mode exit), vsetvl
> and vtype invalidation, itrigger updates, reset and migration
> post-load.
> 
> riscv_get_tb_cpu_state() does not use the cached values yet.
> 
> Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
> ---

The obvious drawback is that we'll have to manually invoke riscv_rebuild_tb_flags()
every time we need the cached flagst to be refreshed.  I believe this is acceptable
for the performance gain this provides.


Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.c               |  1 +
>   target/riscv/cpu.h               | 19 +++++++++++++++++++
>   target/riscv/machine.c           |  1 +
>   target/riscv/tcg/cpu_helper.c    |  1 +
>   target/riscv/tcg/csr.c           |  8 +++++++-
>   target/riscv/tcg/debug.c         |  2 ++
>   target/riscv/tcg/tcg-cpu.c       |  7 +++++++
>   target/riscv/tcg/vector_helper.c |  2 ++
>   8 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 15c27f4ce4..aff6f373d3 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1122,6 +1122,7 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
>           kvm_riscv_reset_vcpu(cpu);
>       }
>   #endif
> +    riscv_rebuild_tb_flags(env);
>   }
>   
>   static void riscv_cpu_disas_set_info(const CPUState *s, disassemble_info *info)
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 49a1186bdb..517f6081d8 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -262,6 +262,20 @@ struct CPUArchState {
>       uint8_t vxsat;
>       bool vill;
>   
> +    /*
> +     * TB flags that depend only on state changed by CSR writes, traps,
> +     * privilege changes and vsetvl; rebuilt by riscv_rebuild_tb_flags() at
> +     * those points.  Bits that translated code changes directly between
> +     * two lookups (FS/VS dirtying, elp, vstart, vl) are added on each
> +     * lookup.  vlmax_cached is VLMAX for the current vtype when the
> +     * VL_EQ_VLMAX fast path is allowed, else UINT32_MAX; vl is compared
> +     * against it per lookup because fault-only-first loads shrink vl
> +     * without a trap.
> +     */
> +    uint64_t ext_tb_flags_cached;
> +    uint32_t tb_flags_cached;
> +    uint32_t vlmax_cached;
> +
>       uint64_t pc;
>       uint64_t load_res;
>       uint64_t load_val;
> @@ -967,6 +981,11 @@ static inline uint32_t vext_get_vlmax(uint32_t vlenb, uint32_t vsew,
>   bool riscv_cpu_is_32bit(RISCVCPU *cpu);
>   
>   bool riscv_cpu_virt_mem_enabled(CPURISCVState *env, bool is_vm_ldst);
> +#ifdef CONFIG_TCG
> +void riscv_rebuild_tb_flags(CPURISCVState *env);
> +#else
> +static inline void riscv_rebuild_tb_flags(CPURISCVState *env) { }
> +#endif
>   RISCVPmPmm riscv_pm_get_pmm(CPURISCVState *env);
>   RISCVPmPmm riscv_pm_get_vm_ldst_pmm(CPURISCVState *env);
>   uint32_t riscv_pm_get_pmlen(RISCVPmPmm pmm);
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 0de06e9588..f0aad72706 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -388,6 +388,7 @@ static int riscv_cpu_post_load(void *opaque, int version_id)
>       CPURISCVState *env = &cpu->env;
>   
>       env->xl = cpu_recompute_xl(env);
> +    riscv_rebuild_tb_flags(env);
>       return 0;
>   }
>   
> diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
> index 58e98e975c..70c889aaa5 100644
> --- a/target/riscv/tcg/cpu_helper.c
> +++ b/target/riscv/tcg/cpu_helper.c
> @@ -982,6 +982,7 @@ void riscv_cpu_set_mode(CPURISCVState *env, privilege_mode_t newpriv,
>               riscv_cpu_interrupt(env);
>           }
>       }
> +    riscv_rebuild_tb_flags(env);
>   }
>   
>   /*
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index af444e3e6f..3dbfe2dc80 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -5909,7 +5909,11 @@ static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
>   
>       /* execute combined read/write operation if it exists */
>       if (csr_ops[csrno].op) {
> -        return csr_ops[csrno].op(env, csrno, ret_value, new_value, write_mask);
> +        ret = csr_ops[csrno].op(env, csrno, ret_value, new_value, write_mask);
> +        if (ret == RISCV_EXCP_NONE && write_mask) {
> +            riscv_rebuild_tb_flags(env);
> +        }
> +        return ret;
>       }
>   
>       /*
> @@ -5937,6 +5941,7 @@ static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
>                   return ret;
>               }
>           }
> +        riscv_rebuild_tb_flags(env);
>       }
>   
>       /* return old value */
> @@ -6015,6 +6020,7 @@ static RISCVException riscv_csrrw_do128(CPURISCVState *env, int csrno,
>                   return ret;
>               }
>           }
> +        riscv_rebuild_tb_flags(env);
>       }
>   
>       /* return old value */
> diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
> index 988bc815d7..e834f80ce2 100644
> --- a/target/riscv/tcg/debug.c
> +++ b/target/riscv/tcg/debug.c
> @@ -822,6 +822,7 @@ void HELPER(itrigger_match)(CPURISCVState *env)
>               itrigger_set_pending(env, i, 1);
>   
>               env->itrigger_enabled = riscv_itrigger_enabled(env);
> +            riscv_rebuild_tb_flags(env);
>               do_trigger_action(env, i);
>               itrigger_set_pending(env, i, 0);
>           }
> @@ -922,6 +923,7 @@ static void itrigger_reg_write(CPURISCVState *env, target_ulong index,
>                             env->last_icount + itrigger_get_count(env, index));
>               } else {
>                   env->itrigger_enabled = riscv_itrigger_enabled(env);
> +                riscv_rebuild_tb_flags(env);
>               }
>           }
>           break;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 5c5d8fcb94..a8e744bc26 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -183,6 +183,13 @@ static void riscv_compute_tb_flags(CPURISCVState *env, uint32_t *pflags,
>       *pvlmax = vlmax_cached;
>   }
>   
> +void riscv_rebuild_tb_flags(CPURISCVState *env)
> +{
> +    riscv_compute_tb_flags(env, &env->tb_flags_cached,
> +                           &env->ext_tb_flags_cached,
> +                           &env->vlmax_cached);
> +}
> +
>   static TCGTBCPUState riscv_get_tb_cpu_state(CPUState *cs)
>   {
>       CPURISCVState *env = cpu_env(cs);
> diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
> index 917a48b510..f1898c52ff 100644
> --- a/target/riscv/tcg/vector_helper.c
> +++ b/target/riscv/tcg/vector_helper.c
> @@ -56,6 +56,7 @@ static inline void reset_ill_vtype(CPURISCVState *env)
>       env->vtype = 0;
>       env->vl = 0;
>       env->vstart = 0;
> +    riscv_rebuild_tb_flags(env);
>   }
>   
>   target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
> @@ -125,6 +126,7 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>       env->vtype = s2;
>       env->vstart = 0;
>       env->vill = 0;
> +    riscv_rebuild_tb_flags(env);
>       return vl;
>   }
>   


