Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE20E606A31E
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 13:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y7pcBTvM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YDPFrc6Q
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xM3kY-00038H-Mh; Wed, 28 Oct 2026 09:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xM3kK-00033Y-QI
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 09:31:18 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xM3kI-00078x-NV
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 09:31:16 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SDI5XR718081
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 13:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hBY695tDX5YPzICZQQyMrGAfDI4ap89KxPVq9zvaFfg=; b=Y7pcBTvM/EEogzFp
 l7jHfRVoJE9v2HNARG8x3wzW5h1Ajh84zFP0p2iVQ644fqLPVxiE5TtwC/UkdFyj
 /mpHYd1fAUvXLdzhQwoUp5dpFc/qqzOCJNuRc2p5Etag+y8QxaIIC4etXSYlNPHe
 PGXO1Xmhg3vsxPjYlBQY7baY7MI3M2xj2VGP9MsR4mKw8OpZ0olNEQLtMEyy70IC
 qEuvDeR4zLkJreR1IarnnseOm37iejy0wWSEMObi1u3MQslRcMjZ3jA/sa4rS0FV
 I5bboPc0Q+EP3T8Fj/wTINqK+JR7MkvBoDbA6JpkDmPgk5OZEqGBTYA1F6UUPvpd
 QL4B8A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjg1px-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 13:31:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93f33438950so204435885a.1
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 06:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793194264; x=1793799064; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hBY695tDX5YPzICZQQyMrGAfDI4ap89KxPVq9zvaFfg=;
 b=YDPFrc6QuD3wlT3D3wQOHos6s70wtWEJf9h9iUikKBwTFxpwN+9phOCYkOlf8XsIaj
 YXFXj+CgbYWM7URhhhOy4XrytBdTRT0fFqCpyPTTZUXwtmshyO53EQmsA8ZAIWJkggnh
 mYSAumnCARBCEyCB5R18bUPfaYbLhQ8n/ei8QN0OC5Iz6sGnSSeNxWL0Rvfn0EWJoRvS
 BU1dOAlz0J9VJdhNT/oRLEF5Q9sip277l3vpMYmfVbQw/n7Qp6OKpsup9kHfEVheD1F4
 ITx8kmp6mMNK4SkAKNQnphDVesxzdgT5DhiqsWYEOENIzOVddgBmN7p2e8xfGF/qjDX7
 NIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793194264; x=1793799064;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hBY695tDX5YPzICZQQyMrGAfDI4ap89KxPVq9zvaFfg=;
 b=0sy7NQ751jdc2pIZoy81n1UUXJ/D26wtDHnA6vUyGsSD2P8u+7PLRnN9e6mDv9ivON
 nIywQisTWel1Fkm8g12V4yNKqjWyhSFzP8QWuPsLoEQWXz+yTfvVE4K0jOht3sGtMOtF
 oszz/Gv9uzW/g2ICw4YXcsCXayKVooFfe/G61cpcN9S3EVASjMdQOQf5vnzWJBROmmDt
 aZpBmR3+4UUwT5FPrN8lvaSgJMzCygvSD9z94MgLQIoChmTmp3Mno7l6uoA7jK03iYhC
 9hkpKdF0w0HiFisBwG/ErNYimToopoTUxMyRKc0KC0d0L/S6e1WW/+ugVDdsu2P+nzn8
 5/Sg==
X-Gm-Message-State: AFq9FYKnyg70oJAgIS/b8ebLREG8EFjfyZwmp4P1pPhzfdOMX/E/Ghmg
 SsRSDLt5NUCh4GOifLszcLWEeCRREI6833cD4q0XWyGNGBve2claNCOGLvxzcYRSsB8KnPDLwkF
 TMkpocbjiJJ6wRpqCk21qij/GsepVb0k5Y31X93DL00o1p+LKmNH/t+fADA==
X-Gm-Gg: AYBFou2RxKBAlkcCN+X7rplAfPot3Bcie68ZeS63puF8yJiTF6Y/edXCXL1QsNYO8iC
 4k60Vzgmm7ipqV84sY3KzWW7Hs29qw+XQXlN7LGiG1w54+CSyfDOkqHM6Y6CDO+MLCQJ4+r8NGW
 Mz76yINByLRqwystltJZfx1hMNPVdZ0zCg3iG0TII4BJn8MG42959VaRPmR7MDkTPqotFz5xgak
 vzUsbWh2zNVKUIcIcKjVarNRRuK8yAEelHc9eYlLBTRVG+2dh/JeaAh01EAAlZWkX8eB+0o+pzY
 jK0hLoIFOFavoim2dAasWoNqVecLylOei5t4q1feD91jJW+RyQyw4+6IGML9WYuGzWjnytyuLcT
 QomP3vzwO6cFzpqZAcr/pXX8E4JvrqZ0c+6rk5MnVlRd7goCl+OFTHTIe2TnbwzoNrPiKGaq+K1
 Tpu/2J5im8Mg==
X-Received: by 2002:a05:620a:4042:b0:93e:4833:82e7 with SMTP id
 af79cd13be357-94408d4757bmr333995385a.46.1793194264353; 
 Wed, 28 Oct 2026 06:31:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4042:b0:93e:4833:82e7 with SMTP id
 af79cd13be357-94408d4757bmr333988185a.46.1793194263756; 
 Wed, 28 Oct 2026 06:31:03 -0700 (PDT)
Received: from [192.168.68.102] ([152.234.122.251])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd4e9968sm605078166b.17.2026.10.28.06.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 06:31:02 -0700 (PDT)
Message-ID: <3cf09147-a718-45cc-a585-125c58952587@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 10:30:57 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/riscv: do not raise the no-PMP-rule access
 fault from mret
To: tewaro <tewaro@theorem.dev>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, disclosures@theorem.dev, tewaro
 <tewaro@tewaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20261022045737.67060-1-tewaro@theorem.dev>
 <CAEq2Q90Lvd4PMtxhj=2B-v5BiOdgBsgo2q5sFV-B4UcRFdEHkA@mail.gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAEq2Q90Lvd4PMtxhj=2B-v5BiOdgBsgo2q5sFV-B4UcRFdEHkA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX9WDaCMkn8FpW
 ES8xUzsnz5rX/M9/cN2dOFJU+ckvYx4XdNdmhcXmsKzNqEx8JQhdsSFfZbROcRbgyHH7jcW07e3
 O+g7olQ3ZP+ozQDGcqN3QklKrprtQikH1oCy1kKpp9vZRqf21NtxheOMApqAyfHkosGvRBPL8+a
 A5nkPF2O2MGrb7eaN7CDREpVDBXb5USZRWw97968ZcOK0zgSVUtbFr82QZL+6M0NjnvKB54Cnqv
 kH/r2YDUkOUB7CUMi96ihpMrJALp9fQPDHQhuFmNx2VBX4O+NbcWZOBzeScwlh1bigXgidS5tXn
 hAfzTO83fwR8uKFZnJgzE5LsPiuRJGvwpngExN6226+CI5o2ier7GUXIc6zHqn5Ul9T7xVP9DXo
 UG1DB9vEAd+me5xn+NZ5lm/anza9dEXiMRFuyBTAk/uAjGENQTgyDDnjPM7VR5GGmiXBrFFHAjz
 JRExrtpUG7HAlZf5Hyg==
X-Proofpoint-GUID: 364So0vVlyWmvNE4wWUuWBFsQzYft4ga
X-Proofpoint-ORIG-GUID: 364So0vVlyWmvNE4wWUuWBFsQzYft4ga
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae1f91e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=QOY8BskYDu05dfarAz2gNQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=xvfqbYfxAAAA:20 a=p0WdMEafAAAA:8 a=-ac9C9j3HyYDXn9xrFEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX2p/suwmFOnut
 JKk2yNDogJr3nKnSmGptXne/zDpjYwA6Y9Gu2UBA1YM1+BeVGuKD+g5OwqypO1Ql0RV7G+Fscgp
 DS7dFLiJTPPQagTb38lXUQIJOD5fdZI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280052
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
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

Hi,

I couldn't apply this patch.  git claims that the file is corrupted:

$ git am --reject \[PATCH\ *
Applying: target/riscv: do not raise the no-PMP-rule access fault from mret
error: corrupt patch at line 18
Patch failed at 0001 target/riscv: do not raise the no-PMP-rule access fault from mret


If I try to apply patch 2 standalone I get a different error:


$ git am \[PATCH\ 2_2\]\ tests_tcg_riscv64_\ add\ test\ for\ mret\ to\ S-mode\ with\ no\ PMP\ entry\ -\ tewaro\ \(tewaro@theorem.dev\)\ -\ 2026-10-22\ 0157.eml
Applying: tests/tcg/riscv64: add test for mret to S-mode with no PMP entry
error: git diff header lacks filename information when removing 1 leading pathname component (line 8)
Patch failed at 0001 tests/tcg/riscv64: add test for mret to S-mode with no PMP entry
hint: Use 'git am --show-current-patch=diff' to see the failed patch


Can you please re-send both?  Thanks,

Daniel


On 10/22/2026 1:57 AM, tewaro wrote:
> Consider a CPU that implements PMP but has no PMP entry configured.
> If M-mode executes mret with MPP set to S or U, QEMU raises an
> instruction access fault on the mret. The trap is taken in M-mode,
> with mepc pointing at the mret, mtval zero and MPP equal to M.
> 
> The spec says the mret succeeds and the first S/U-mode fetch fails
> [1][2]. The trap should therefore be taken from S/U-mode, with mepc
> and mtval equal to the mret target [3][4] and MPP equal to S/U [5].
> 
> The early check in check_ret_from_m_mode() is what moves the fault
> onto the mret. Without it, the fetch at the target misses the TB and
> TLB caches, which are keyed by privilege level, and reaches
> pmp_hart_has_privs_default() through riscv_cpu_tlb_fill(). That
> function already denies S/U-mode when no rule matches. Nothing
> executes between the privilege switch and that fetch, so no other
> behaviour changes.
> 
> As it stands, S/U-mode can never be entered on such a configuration,
> and a handler that steps mepc past the apparent fault resumes in
> M-mode at the S-mode entry point (GitLab issue #2074).
> 
> The check was added by commit d102f19a208 alongside the pmp.c change
> that makes the no-rule path M-mode-only, and I believe it was already
> redundant then. Building v6.0.0 and v7.2.0 with only the check removed
> confirms the fetch faults as expected. Later commits (0fbb5d2d3c9,
> 4c48aad1, 3157a553, 16aa7771) changed its gating, cause and location
> but not the normal path. Remove it and the now unused prev_priv
> parameter.
> 
> The bug was found and debugged with the help of Claude (Anthropic),
> used as a research and debugging aid; the patch was written by hand.
> 
> [1] Privileged ISA v1.12, 3.7.1 "Physical Memory Protection CSRs",
>      Priority and Matching Logic
> [2] Privileged ISA v1.12, 3.3.2 "Trap-Return Instructions"
> [3] Privileged ISA v1.12, 3.1.14 "Machine Exception Program Counter"
> [4] Privileged ISA v1.12, 3.1.16 "Machine Trap Value Register"
> [5] Privileged ISA v1.12, 3.1.6.1 "Privilege and Global
>      Interrupt-Enable Stack in mstatus register"
> 
> Privileged ISA v1.12 (ratified, 2021-12-03):
> https://github.com/riscv/riscv-isa-manual/releases/tag/Priv-v1.12
> Current source, same wording:
> https://github.com/riscv/riscv-isa-manual/blob/4877e41a/src/priv/machine.adoc
> 
> Fixes: d102f19a2085 ("target/riscv/pmp: Raise exception if no PMP
> entry is configured")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2074
> Signed-off-by: tewaro <tewaro@theorem.dev>
> ---
>   target/riscv/tcg/op_helper.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
> index b67c7718db..a355d28f4b 100644
> --- a/target/riscv/tcg/op_helper.c
> +++ b/target/riscv/tcg/op_helper.c
> @@ -423,7 +423,6 @@ target_ulong helper_sret(CPURISCVState *env)
>   }
> 
>   static void check_ret_from_m_mode(CPURISCVState *env, target_ulong retpc,
> -                                  privilege_mode_t prev_priv,
>                                     uintptr_t ra)
>   {
>       if (!(env->priv >= PRV_M)) {
> @@ -435,11 +434,6 @@ static void check_ret_from_m_mode(CPURISCVState
> *env, target_ulong retpc,
>                                       env->misa_ext) && (retpc & 0x3)) {
>           riscv_raise_exception(env, RISCV_EXCP_INST_ADDR_MIS, ra);
>       }
> -
> -    if (riscv_cpu_cfg(env)->pmp &&
> -        !pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
> -        riscv_raise_exception(env, RISCV_EXCP_INST_ACCESS_FAULT, ra);
> -    }
>   }
>   static target_ulong ssdbltrp_mxret(CPURISCVState *env, target_ulong mstatus,
>                                      privilege_mode_t prev_priv,
> @@ -465,7 +459,7 @@ target_ulong helper_mret(CPURISCVState *env)
>       privilege_mode_t prev_priv = get_field(mstatus, MSTATUS_MPP);
>       uintptr_t ra = GETPC();
> 
> -    check_ret_from_m_mode(env, retpc, prev_priv, ra);
> +    check_ret_from_m_mode(env, retpc, ra);
> 
>       bool prev_virt = !!(get_field(env->mstatus, MSTATUS_MPV) &&
>                        (prev_priv != PRV_M));
> @@ -515,7 +509,7 @@ target_ulong helper_mnret(CPURISCVState *env)
>       bool prev_virt;
>       uintptr_t ra = GETPC();
> 
> -    check_ret_from_m_mode(env, retpc, prev_priv, ra);
> +    check_ret_from_m_mode(env, retpc, ra);
> 
>       prev_virt = !!(get_field(env->mnstatus, MNSTATUS_MNPV) &&
>                   (prev_priv != PRV_M));


