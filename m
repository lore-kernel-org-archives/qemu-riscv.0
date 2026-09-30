Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD152CA5FC4
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 18:26:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBz0P-00058E-5I; Wed, 30 Sep 2026 14:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBz0M-00057h-6m
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 14:26:10 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBz0J-0005Sa-Tj
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 14:26:09 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UHfEPa2902248
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 18:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AcQqtxrq9kSTdnEAU6EEBDtma1couIcZMR7l45ScqNU=; b=K6koTTKvaI7pD3KT
 Xb/Hp4QtJu+LxyLGSqvvzG74UXGUldy13NzKCVq4SdVtTABiZz+MjJXyYsSVgou9
 iuYZV2MsxQcd4XMmhLxrkwatR7q+D3aWrtkcEBYO6FvwjuhnA/Iyf8gbMnruYbIU
 dlIkGUySIytV4ouLrJTY+o/zFNEooy3b3B/n59Ty/2uaHT/heLwz1gqhQ1J0Blwy
 w6rJb69pdqH1JQ0A0rf1pOAQDvLFYvN4xn3INEppQWospxwsUB874eYBQrPVCKf9
 z4dxLYm8GuTiOARsrBYg2szEd4Stc6ndmedXzwHWkWCdkvr23SiiUdWx1vx0B1je
 mS7Q/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c2x8t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 18:26:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93a01d1d1b6so1009494685a.1
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 11:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790792682; x=1791397482; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=AcQqtxrq9kSTdnEAU6EEBDtma1couIcZMR7l45ScqNU=;
 b=TWThFmky+6KISVXkZaeUXMCmC3mOCgPzZPL+KiJrSbRVcPzzz878vs3uea1gai2/pi
 e+1Q7QrdpzDPhtYvCvMnqOOGcVbM0Py7a1B6b+cok4r2meLuQOLTmD07D5JETmLL0Vc2
 sRA4u6bUbnrhe+1LTpM2WsJbbx8ZddPSAnylt2guVb3FlMYV38O1s65xXnI+2jC12hqL
 OHQFBYdwfYBhlzuXZLRyAkX/aLf47Hlbu4CHA49sRn4aBYfuktJBScbMTHntADBTYkkP
 gCJlC4Bq0srJ+0BS/bQ37S6uxipWginABZw5Cacbll+JdtfFcdHesdEATmzMpdAyhIux
 xAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790792682; x=1791397482;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AcQqtxrq9kSTdnEAU6EEBDtma1couIcZMR7l45ScqNU=;
 b=CdHJYmpfTtlKqPdvLiYXhNKmVGpxnHsKT36PdKsLaoOS33W5w+3fLDsZyVPDmcDABa
 e5m7vcfjLZX2VEzsK9wFAugMj7GapX9DcttZPDx0obL6uyI5/iXU4RIcxxzF4oyw1jyN
 k1fG2YHfVvqrH8f0A2Hq/6FKdWLNb7jIbCuNKNrNusx04h6KGBAkPkGXXE/te/ypWWRB
 vAMsTV8+46MPh9YW+QoY221tOQivUmPRn55FQT0AtKaJ1gfB+j/vDX2gYOY8+3rWrNxP
 5HDI1uAo5uBSHkBe8VwxMCRUzox7XCHLcDJWfhWwaddo897Gsc9Fs7ITHy8NSCLCwy6O
 u/Xw==
X-Forwarded-Encrypted: i=1;
 AKwUvBx/gpoIom46e2NaXT1UOwH6bplinm/SeIN+0MjLQxZhiT+XqIs87HunC3LS2DFHx9aEZPqR2qfy4qED@nongnu.org
X-Gm-Message-State: AFuF++lpe4jleZlfxDmTDXcadyJ7Q7OIh//89ebETis/wqhv1Kqw8kyI
 rU+Li9AvW5AAfIMtM2O6WAGP8i/abhZDH6i6hMIo/Rjqb/up13LD3jZpUkqAxx2AMMqIUs3pCq6
 C+JNFPR2/iNK/2SRy4eOmxT23EUlsSZGZI2Dwnxu85A40Nj30PhtuvZBq2A==
X-Gm-Gg: AYBFou1WnfB9SUZGdJZ3gfVcvWdtkEwz4ex7suXeivb8amqK+CMjD8H1ECdsZ+iodex
 o8/wvB3/LrsI+YeEG8q/K6TIb7EEpkIMXRX1nbw6SanpIoJDkRa/th3HYgA9/MNTdD2ClRYfgXi
 n0eBIYVXsM7cvCslRUU5qocaJ1qQSFjCg87Qh+Zfb2rRzmlZcAZ3qVLebZFffO36HcBmr4I4ViJ
 3mkNBxHgNptV/PEwGD1ZN4ADL9dW1wUaWFdDgCdALYKeB2vHYQOa06HQLWGKqgFHszFPPa0iJeP
 SD82mieXTAYqktJ+ojIsbq+lrawq/TMa861RGP2Vr5Mz43uVjTsQKvEeqZtTAB8MyL1Dkxd1wW/
 ivKb7wU+azTqXru+NqPN5jBxHgIIz81EI6A==
X-Received: by 2002:a05:620a:2944:b0:93c:9ba9:2b9d with SMTP id
 af79cd13be357-93ca9651b4fmr396724285a.19.1790792681789; 
 Wed, 30 Sep 2026 11:24:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2944:b0:93c:9ba9:2b9d with SMTP id
 af79cd13be357-93ca9651b4fmr396719485a.19.1790792681237; 
 Wed, 30 Sep 2026 11:24:41 -0700 (PDT)
Received: from [192.168.68.102] ([187.10.234.20])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93cb6356ec4sm28290585a.6.2026.09.30.11.24.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 11:24:40 -0700 (PDT)
Message-ID: <7a320a89-efb4-4520-80bf-d673d514e39a@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 15:24:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] target/riscv: bypass smstateen check in debugger
 mode
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Chinmay Rath <rathc@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
References: <20260911-query-reg-v1-0-0c04f0c02cf3@redhat.com>
 <20260911-query-reg-v1-8-0c04f0c02cf3@redhat.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260911-query-reg-v1-8-0c04f0c02cf3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3NSBTYWx0ZWRfX7qhJqzxh9A1/
 Gl38/Jw/TBL1ApSz/qDIL0KnLGPV2Ycrli/9bHuBv5P4yGIsjzKLlshCdBKdSHuc+5Hr9EW2+dE
 /OoDGiBxFfM0oqelOTnLSeQ3FMpeQ8Y=
X-Proofpoint-ORIG-GUID: QZxmvl8a7bZAuKOgEZHEl1V3fzuZMz5c
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abd543c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=jbqyKmyYbxlRs/MVMa3Ccg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=MxrccPtz3TexQuPw8uEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: QZxmvl8a7bZAuKOgEZHEl1V3fzuZMz5c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3NSBTYWx0ZWRfX985GG36ZbfCI
 GkduimY9V9vzY4I4DjbjIoup8yrA5jya3BpuL3zIwBeMeesSYM6mLSiVFxg7QVhm6AKGulSUYbU
 AOJ/BMu4qmnY7DcAj+JvTi3mqoGPPXLjFM370wFOzehm8n13zOV3/Ngm38pkZ4ExLVgIaxtCX4j
 ZC4N/RUk2FCrQPMq8F/JnbsydFYIBH6HSDwHbgxTbgW5FHt0GeJt8F1utchnBHdiSr8kamPmEC7
 kbjCmyWN3essYXlXjIKz9NW9o8XX2hVsZ5oD8TxKqxBSNBn7bITlrjbOZM0Iwi+0nhpi2hIPxpB
 Xz5m77u7nlm5Q/ZMnGw9HDx7xFkH++83DX5rwqiZmg8fDz9CNDME2wGdhtubWBszLq1EQ3Aq5Ye
 y6DY1vHPH70M4eO3DK+9eZ7meb8b9qAzWukls+HkhvFarNG3W3IeSLF12CCHlcGmLtfJ4ScquTw
 yPYUxUv5NTGvcU1E8aQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300075
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 9/11/2026 9:27 AM, Marc-André Lureau wrote:
> Allow to read CSRs gated by Smstateen extension when env->debugger.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   target/riscv/tcg/csr.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index bd4b6dc114bc..93a7f419f29f 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -53,7 +53,8 @@ RISCVException smstateen_acc_ok(CPURISCVState *env, int index, uint64_t bit)
>   {
>       bool virt = env->virt_enabled;
>   
> -    if (env->priv == PRV_M || !riscv_cpu_cfg(env)->ext_smstateen) {
> +    if (env->debugger || env->priv == PRV_M ||
> +        !riscv_cpu_cfg(env)->ext_smstateen) {

We have an going work in qemu-riscv (sdext, currently on v10) that adds
a new 'debug' mode that is higher than the machine mode (PRV_M).  It
already uses env->debugger in its logic.

I believe this change is already in line with what we want there, i.e. debug
mode having at least the same accesses as PRV_M.


Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>



>           return RISCV_EXCP_NONE;
>       }
>   
> 


