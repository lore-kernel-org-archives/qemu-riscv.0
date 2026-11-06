Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A93606A326
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 17:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kLM5DBmM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HOP/Oxi9
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xPODz-0003ez-BI; Fri, 06 Nov 2026 12:59:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xPODn-0003dW-3u
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2026 12:59:29 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xPODl-00083B-Ei
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2026 12:59:26 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A6Ht4mG433233
 for <qemu-riscv@nongnu.org>; Fri, 6 Nov 2026 17:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ca2LWgPJo42AdxTkGZKZukyYP0lfwUeuA3UfJnlGT3o=; b=kLM5DBmMyHeQOKE/
 h3rhmPc67k1aXllIZganTf5D0w+WFJVzDE1E2V12/tkT751U4D1UEkQ4vyc9kgQi
 VD4xOTouajBmKt2z4i1FPL/NNl5BB9J3nsigDTAsQwLs/M8Xu0WecNUg7iQB1sJ8
 6UKwhGO5YDga4JyLgxzsmwabXOgjWf9KrmP6T261NGUE/GgxAu6WF3IJuX9cvZJf
 55/fOmkGwxFhDstyuREdpLx895tEEytlWKxou5P9WaYff4ShMKk0jnr5wHY2e5ay
 7qsnJhuFZbAE4GN1lMFqPr5fuTSgmLUUaHr6HBXwZjaTdc95i4bHuEyR0phJB/54
 G6prjw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa404u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 06 Nov 2026 17:59:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-33c35f5ca6cso1634483eec.1
 for <qemu-riscv@nongnu.org>; Fri, 06 Nov 2026 09:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793987962; x=1794592762; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ca2LWgPJo42AdxTkGZKZukyYP0lfwUeuA3UfJnlGT3o=;
 b=HOP/Oxi9jZdweg6M9D1Bk1FQMOIJwccn3RCOxtqiXQmJB4qxDvMXpgtAqaXgYrwchw
 5SpwonI1nlvEa3nyIJMOWQLtmE60W64Qhms3ZexFyWMxVBxNIYbIfGiF+scTgiPj4uQQ
 vN+BX5yS0qW7DYNaTOiG1rvQaxLfFD4pErvhVnEkpHgD2iZ2qW15et8x2r23uyWlmy06
 +giMfSys/BwzmfkxsalnqHUbwoAUZqHezp67tfhPZ5rAMy6Z4Xr/4SN18XvIzrEM7ljc
 FmuGAAteZDc9s0kxDKi24yA7tJVzCSvrZ9gSxXhmA6lwSP3C9wg3MLPX+AuIb4pYWc+x
 MGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793987962; x=1794592762;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ca2LWgPJo42AdxTkGZKZukyYP0lfwUeuA3UfJnlGT3o=;
 b=i5fg+l3WFZnE/GWv6fEhhxqA07KxzAUcJo4A160d6lg9ORcEu66WwDNzGzuILb/05Z
 8YIRtoO6GRAEuuSnzVWpPkj3yh6uDjUl+dLKVxkWFsL+apmA3aZkzRFAoipehCVfpPAr
 Asut1RtlDunfXNw1sbexUDOAd5VORDiEPmGUJcuecODb4Chzl0IP+OMkOS19cVQVS11u
 c7qGwIe3q5SLXf+j9dvMqa9VrrFL0oXYOkQ7owgjuwsBQJwIfv7SuDNoCUQ/ifUmgWNP
 tW0OFVqgP4m5YqisCkbSkz0KQIFaDpxTkvwKPDABIXAZAfNPgMgAIsPMIDbSespNvPzg
 0aRw==
X-Forwarded-Encrypted: i=1;
 AL+hErH6KZHcebAmdNicahD6G+4s90I0AfPW3OPnneRHPcLTuCwLyyDLWBMyeJ/TDUTO/pBkqLuzobgAaAru@nongnu.org
X-Gm-Message-State: APuU4Z+mYUbnoJAFG1VAFOCuXT7YecsOBTMlL89j4oXrDfCaflg35zgw
 b6XrDIDgKNsO6Fpfm3v22B35ns9gu/cvYzseZe3ri9+aZyIbxfEKMSrD6adbqBwmI6UstNfof6f
 NwFVHVQi9lvTjmKSkrNhis0u10v9HC6fuBCLtwlRCu4Lt0YaJzwLxddjY0A==
X-Gm-Gg: AYBFou1GwUrjygYvpgtDMiN7+RhlYL7sprO7ept0irIXwH4mF6sQiC1StzQ5WU9OfSu
 hrwj3iS1/1cw1eu5SI2UlkJpAMCkOpjUwbsbBPlr/sYzgWzLh+eyxGy42agCyy5LLPplP7aW/jx
 r2baXf3cjDwEkHiBeMAQyRCGAORndy7X80b20X2SbfdbNh5Tq2qu0O+qHAQ+gAcQlO/NS7M1Vh9
 MYRW3Bn88rSVCi4WmTG10YTKGhKs3jtIDqWH7NKAkPFg3Dn76zpSLjFnNbeenSbhHnFZtJg3swe
 n2Q6MAP/DqsQo/s8eYWrVNvuckDOfvIjdOkKEYzFPoyZ/5aChyScSVk+V1e42vAzFC0edevsjEr
 f31RFou+NfOJOd7cPQh7wWxvDlqanl2Qtak7fjepLcVSmtzmAlxzWSH8shYQWqCZLTpTK0B1gqF
 7UQng9vMkV6ZVbSZd3HwDaUONHlbbwD0ftgS+dHDff9Q==
X-Received: by 2002:a05:7300:8807:b0:36a:4a68:84e5 with SMTP id
 5a478bee46e88-36f7525245emr4799757eec.8.1793987962191; 
 Fri, 06 Nov 2026 09:59:22 -0800 (PST)
X-Received: by 2002:a05:7300:8807:b0:36a:4a68:84e5 with SMTP id
 5a478bee46e88-36f7525245emr4799719eec.8.1793987961436; 
 Fri, 06 Nov 2026 09:59:21 -0800 (PST)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36fa8c4f28dsm7707429eec.9.2026.11.06.09.59.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Nov 2026 09:59:20 -0800 (PST)
Message-ID: <a97b0f72-fb7c-4f5a-bde6-b542056d6e5d@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 09:59:18 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] accel: register CPU parent only for AccelCPU
 subclasses
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Chao Liu <chao.liu@processmission.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Weiwei Li <liwei1518@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>
References: <20261106023936.772-1-luoyonggang@gmail.com>
 <20261106023936.772-2-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261106023936.772-2-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aee157b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=oLONm9El9VE_NHCh4NYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3MSBTYWx0ZWRfXztM0xqAHQQ5d
 nUWrhTYp63rV0Fyr8G1Gxf48e/OoqdEbZ5eSHoV6lB13MwOUAA8r4rYkn8TyxzcjPECSzn9SPXk
 u2fvvh95ShmOEaPUcNOYRjf328eGVjc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3MSBTYWx0ZWRfX37s5FGR+7Epa
 /i64iyoznPKL5VEQeGcOpcx7JH+nOGBC+X0BSq2JogXRE4ds8GNV6U+JvaxXqeJqccrozjv4Grd
 7EaLI1N4fqmEMrDekH+Ah5nsnSGrSc1bBrQ1a4iPfQnX812mAUO1GHSwc0CBlemvMQSJtBSOPiq
 gerqw6eHKnsmwvs2HaDTDffjCrk4Ql7kt5z2j4ObcI99Ax7D72/YsCCJBrFVDCHnzVrC2Hnc9we
 e0Pk3ADSbQ6Q+GvS6Wv1qQ68ZWWJKP4Ja6dCEdtIa/hsiJMGpJhk1smxNRMzpjDWBCBwvl1ReOX
 0jDkecr2qfAmbqb3QPBU2HtFUXidD4EiWVZqAY5Qp3B4sAEBERffoNGNNQqCMYe9gH1Q083bTNe
 Q1L0jMJNZvQ8TYL7oScclYOrTbmBhXhmYN2defbtsPMcc+rlwLurwX7YEO2djaTvJ0Mt7j3ldCM
 d/ZlVindiRyCu6wKkIA==
X-Proofpoint-GUID: C3A9CFEZvCf3h3iFu8to_FxVaxehmJK0
X-Proofpoint-ORIG-GUID: C3A9CFEZvCf3h3iFu8to_FxVaxehmJK0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060071
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/2026 6:39 PM, Yonggang Luo wrote:
> accel_cpu_register_type() creates the abstract parent
> accel-<cpu type>. A subclass names that parent, and
> type_initialize() aborts when the parent is missing. The old
> type_init registered only target_cpu_type(), which is one name
> in a multi-target process. Call the helper from the CPU type
> init of each target that has an AccelCPU subclass.
> 
> ARM calls it because whpx-common.c parents accel-arm-cpu on
> aarch64-softmmu. i386 calls it for TCG, KVM, HVF, NVMM, and
> MSHV. i386-softmmu and x86_64-softmmu each pass their own
> CPU_RESOLVING_TYPE, so WHPX on x86_64-softmmu finds
> accel-x86_64-cpu. RISC-V calls it for TCG and KVM. PowerPC
> calls it for KVM.
> 
> Other targets have no AccelCPU subclass. Machine init looks up
> tcg-accel-<cpu type> or kvm-accel-<cpu type> and skips a missing
> class, so those targets do not need the parent.
> 
> No extra tests is needed, as these QOM types already be
> tested by the existing logic instantiating all QOM types.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  accel/accel-common.c      | 6 ++----
>  include/accel/accel-cpu.h | 2 ++
>  target/arm/cpu.c          | 2 ++
>  target/i386/cpu.c         | 2 ++
>  target/ppc/cpu_init.c     | 2 ++
>  target/riscv/cpu.c        | 8 ++++++++
>  6 files changed, 18 insertions(+), 4 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Tested-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

Regards,
Pierrick

