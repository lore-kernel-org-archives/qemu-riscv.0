Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D491606A321
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 14:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n5WNsrK5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bQ0eEnOy
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQQCz-0001F5-Gq; Mon, 09 Nov 2026 09:18:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQQCd-00018u-N8
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 09:18:33 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQQCY-0002BO-Bk
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 09:18:29 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9DFMSh023098
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 14:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TM/B2DDTW/1Qc2o7nXFx180ursBB2ql+DPcYfnqPWB8=; b=n5WNsrK5gWe9TQDI
 5nQ3xQ4HVKkluHkEf/TjVohB1N8XWh5tCzWBSj/kRIKUUaxhXKQTWHoBdR/SIJLX
 hRkP1kdToqBdWpLECo69H8UtWuMxoRrU8ct91V7Q9bI5BT/qaNxijQnIaJWjUHM0
 yJuSEpEdLnhDfmVKzLnhxI7+p2EzflIyf+K2nKwZpgARXEa/4tvA3+3UbdHqF+iA
 hS0TLRk8L7ibOR7pJ4Oypta10W0zeqkrMqC+U0tgJXx5mMeqtEeAuAColN5RjXv+
 lXSBvA8CndK5pRQxVOgL6bBOrEWfdaKiQ6YQQrJbJPumvyIOpotgt81Ojtf0PRPg
 s8hIKw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydgp5d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 14:18:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5337ed1ba44so20113541cf.3
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 06:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794233904; x=1794838704; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=TM/B2DDTW/1Qc2o7nXFx180ursBB2ql+DPcYfnqPWB8=;
 b=bQ0eEnOyMksF56cdc/1UjYGE3Ev9V+hMOBNDi9JiNlRm44Gacfdx7A/AGg3SLnuEhn
 pBNEhv3DWcB9BPM4705QQYoDj5zKZSeSF/erueqOjL3ix9xAjO9LC3aVaWRXBMLDj2jN
 zTudD21uMicWByOLWLjWzUXl4xwThWweLR+wGACUCu0Ve8UfSOrq2k1UDC+tPC4G/+WZ
 3iOQ/f2fhZP0vo1PPz91qrmRaX8dYw7nho11XVjIhCvv+AcY1GdGcfOMJsOhbqy+mN6D
 YjVlBBhrZKABw2NoizBw8RWuWw/C7xBY6UsfSI94OnDL7UKSrIH1qaYp6xY2VjC+rDqG
 WngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794233904; x=1794838704;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TM/B2DDTW/1Qc2o7nXFx180ursBB2ql+DPcYfnqPWB8=;
 b=03yqiAOwm0GzjxrtyuwEBkQWnBeKkYoT6GOsc0Wi1Nj5ZviCa2UGdVcuvec2lFerXD
 zoSk50PJ96CyfwyY6Yhw28nLodVAPF3CDZ5HCcR9/bd9sS0QL0ztbUlXRZSh3WxdA7xt
 SKil5kjHC/DiMrAHTPz5qFO48jbPPqo54lSzdImgVb2ISzTd5mGpGR8oZOwm4y1o3e/D
 3ZqdVNZs80z0DmCEDo9DspcRVx8495fQ41UMeAKjEDdXT/aEzzWnVHE4SGnt4qlYApz7
 ZibPW1HGEccUbBBK2Y8K91YOipxw2/CaOOKa87j+j1Utaauy/eOVXeLGlC/ErbPi8m6/
 K4Qg==
X-Forwarded-Encrypted: i=1;
 AL+hErEwD32bpQvZ8CyA9OCepm5E46ccu34DBz4oT+i9bpS+a+HCLNXFoTCFg+FftLK5YWsJMsK8zFdOA/F2@nongnu.org
X-Gm-Message-State: APuU4Z+whalBdkiq6joBU48evhQo0IxrPQDwLmfYXaDLg7zat6fGlQUc
 DCIkIUmYtZr8mwm9LxNS3avmydpMrWtdqU+vAWgnXun/l0m8aN6mhjcUrF2Z/m4WBautC2fI2SY
 reBlol2T6uTVyrD0mb3dcFpMMubRfj32Dz1CzqzKJBI9tgqFNDMpUNhErXA==
X-Gm-Gg: AYBFou0lbNgZ+0BH7mYgbF9DcD2mFIsFb4Q5/n6SnSfT+eYiPdv++LCAUY/OBZow+Cf
 0HYcvXGewQdLFKPlN6joU3HE6KqOEU2jB7urwVnsiCFXLGrL2iF0HiCDmA7AJ6xVXdi+7ZvxeO5
 uhf5g44dvJSn7ltZ8UOFqVZ40IwVmneqBq/pxbPtFyI/6K/4kLEe0S9cr6+Kp7b2BszoNG4sO7f
 iPUgw0MC6jGbOI4P8Li1KsWmZkeQAEehx/ScTCh72EhFHifoZPHmGZBrp0yxGsM7ndY+bCMg92T
 WSQCzv+tKkeVDuMffT2QiDbKAUZu55HyQnKl7p1bdHb+9AYwF4RQDJ527iBOK0iKWo3ge9htvS+
 z+YBKMVAlhPq8kLdsjJW3QgskQPDX22PO8kVkqorm4KovdGm5heVIhJTRZo/yGDndEoDUqaJ+a1
 8eS1Y9mImJ
X-Received: by 2002:a05:622a:587:b0:54f:856e:6793 with SMTP id
 d75a77b69052e-552a578ba94mr63545711cf.70.1794233903534; 
 Mon, 09 Nov 2026 06:18:23 -0800 (PST)
X-Received: by 2002:a05:622a:587:b0:54f:856e:6793 with SMTP id
 d75a77b69052e-552a578ba94mr63545161cf.70.1794233902969; 
 Mon, 09 Nov 2026 06:18:22 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-55264b242b7sm41389921cf.28.2026.11.09.06.18.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 06:18:22 -0800 (PST)
Message-ID: <83d87549-bd1f-492c-8951-5816197cf0b3@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 11:18:18 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/riscv: report the write pseudoinstruction for
 a failed VS-stage A/D update
To: tewaro <tewaro@theorem.dev>, qemu-devel@nongnu.org
Cc: disclosures@theorem.dev, tewaro <tewaro@tewaro.org>, imaginos32@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20260705140508.17692-1-imaginos32@gmail.com>
 <cover.1793677944.git.tewaro@theorem.dev>
 <d14b2d1dcfa4eddff7d3bde86cb560130fd07877.1793677944.git.tewaro@theorem.dev>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d14b2d1dcfa4eddff7d3bde86cb560130fd07877.1793677944.git.tewaro@theorem.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfX+R+FDHPDp1xT
 BDhNsil3vs1SZ/EADYawvBOGjjDE6O2bWns7tE8mRoXvZcHxx27P66rB78FrgEkAZo2NtlcjV5u
 Yi67lKWBNVj99csGtmsd2AbMKbE46Yk=
X-Proofpoint-GUID: 6EmyqXmCwCHsGmyyB1yqfy5bQ0L3WQ9D
X-Proofpoint-ORIG-GUID: 6EmyqXmCwCHsGmyyB1yqfy5bQ0L3WQ9D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfX5hRoaZVxoj+T
 ccrgMSqDPIea4erVqgXk5wcdXjpYcYs1i336mQDRGRgUkrcidxKIEBvugG03oDcmHh4+FEsAO9e
 AaLunol7DLCYB+48mkBLymaCJHnI+qSoJAREeYKdD7cy3rMzDGGtGfppXQU6Y/TdffDTwOUpuoQ
 62+xoOljw+lh7Da9nKXgItKxD8AZ+TVJawom/RsyH6p1jh8iVWZ6PPUJzXegwyXub1SW7rKumFT
 3UwRy7jDVSzsMkUUmv3itRYmwjrOq/9dixEcSzcvZNpOLJfvkqCK+bDfKI3egfeJlUbczSgYC3p
 rshiqqWpe3F1yySOTlldFqCSfM/t7/UQmroh05GgOfXkuL8GhVRmkLKPlrhB4ZJsHV/f/j3znQK
 Gv6F3CfVQmcy48Oqf2DhOfcI/p/Bi+fCLg0bzuZs1OcOSnHRdeSslCZk7vU1TQoJrzdKIVnBhAM
 oE6f8V7PUm9+JYCPXhw==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1d630 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=xvfqbYfxAAAA:20 a=EUspDBNiAAAA:8 a=9uaYBcg-ATQH0-gbxMEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090056
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
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/3/2026 4:29 AM, tewaro wrote:
> When a G-stage fault is taken during a VS-stage page-table walk,
> riscv_cpu_do_interrupt() writes a pseudoinstruction to mtinst/htinst.
> This instruction says if the walk's access was a read (0x3000) or a
> write (0x3020) of the PTE [1]. Commit 366b4fba0fae made the A/D update
> check G-stage write permission, and sets the write bit when the trap
> cause is a store guest-page fault.
> 
> The trap cause is the wrong signal. The cause follows the original
> access [2], but the pseudoinstruction describes the implicit access
> that failed. The two disagree in two cases:
> 
>    original access   failed access   Spike reports   QEMU reports
>    load or fetch     A/D write       0x3020          0x3000
>    store             PTE read        0x3000          0x3020
> 
> They agree only for a store that fails on the A/D write, which is the
> case 366b4fba0fae was tested with.
> 
> Record in the CPU state that the G-stage fault came from the A/D
> write, and use that for both the data and the instruction tinst
> sites. Clear it on entry to riscv_cpu_tlb_fill() and after the trap.
> 
> [1] Privileged ISA v1.12, 8.6.3, Table 8.12
> [2] Privileged ISA v1.12, 8.5.1 "Guest Physical Address Translation"
> https://github.com/riscv/riscv-isa-manual/releases/tag/Priv-v1.12
> 
> Fixes: 366b4fba0fae ("target/riscv: check G-stage write permission for VS-stage A/D updates")
> Signed-off-by: tewaro <tewaro@theorem.dev>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.h            | 1 +
>   target/riscv/tcg/cpu_helper.c | 8 +++++++-
>   2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 49a1186bdb..d56566d8c8 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -445,6 +445,7 @@ struct CPUArchState {
>        * address translation for the VS-stage page table walk.
>        */
>       bool two_stage_indirect_lookup;
> +    bool two_stage_indirect_write;
>   
>       uint32_t scounteren;
>       uint32_t mcounteren;
> diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
> index 58e98e975c..063525cfc5 100644
> --- a/target/riscv/tcg/cpu_helper.c
> +++ b/target/riscv/tcg/cpu_helper.c
> @@ -1544,6 +1544,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>                   if (fault_pte_addr) {
>                       *fault_pte_addr = pte_gpa >> 2;
>                   }
> +                env->two_stage_indirect_write = true;
>                   return TRANSLATE_G_STAGE_FAIL;
>               }
>           }
> @@ -1785,6 +1786,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>       hwaddr tlb_size = TARGET_PAGE_SIZE;
>   
>       env->guest_phys_fault_addr = 0;
> +    env->two_stage_indirect_write = false;
>   
>       qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
>                     __func__, address, access_type, mmu_idx);
> @@ -2233,7 +2235,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                    */
>                   tinst = (riscv_cpu_xlen(env) == 32) ? 0x00002000 : 0x00003000;
>   
> -                if (cause == RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT) {
> +                if (env->two_stage_indirect_write) {
>                       tinst |= 0x20;
>                   }
>               } else {
> @@ -2256,6 +2258,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                    * doing VS-stage page table walk.
>                    */
>                   tinst = (riscv_cpu_xlen(env) == 32) ? 0x00002000 : 0x00003000;
> +                if (env->two_stage_indirect_write) {
> +                    tinst |= 0x20;
> +                }
>               }
>               break;
>           case RISCV_EXCP_ILLEGAL_INST:
> @@ -2506,6 +2511,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>   
>       env->two_stage_lookup = false;
>       env->two_stage_indirect_lookup = false;
> +    env->two_stage_indirect_write = false;
>   }
>   
>   #endif /* !CONFIG_USER_ONLY */


