Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF42606A321
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 20:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RfCJX5fn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iyK0c4c8
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQVmm-0005C7-Cj; Mon, 09 Nov 2026 15:16:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVml-0005AE-1u
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:16:11 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVmj-0005i6-AN
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:16:10 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9HHEWO879372
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 20:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Zx9vuv3vdrGUOXhtJ5gk9kZNZFeFJC7ITsqFfkKlqNM=; b=RfCJX5fna83X8xhO
 oJYDuj/tvsO7Fp68y0tlZvw21T7gjbi9BkovGw/0hkPldV40pvWymi7KZtsoYh0J
 /KVWEqEys9muNQcvdyv5j96YLoZ2MSXXge7nRqu6/OuPgmOZele6xXlEXGkX+nqg
 X4L094eJ3iEQGSSs8AcUVtyjgdVm3Za1G2hmpbeqqnJ4FH14w52XXdTdxWQaoSLt
 wg+bp9l5VDubJ961L4uTPgdgJUrQ91Ca1Q0dem6/TOc3/KTlrP0aNvLyZ3NF8Yf0
 gbUTKj8cAzM/ftJsL/smirSOWm53rw+ZLfpIHtFyR7C+qtGhVxSn7YJdngw0YICO
 0UCSWg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5t0kj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 20:16:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91ea5866643so25273526d6.1
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 12:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794255367; x=1794860167; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Zx9vuv3vdrGUOXhtJ5gk9kZNZFeFJC7ITsqFfkKlqNM=;
 b=iyK0c4c8FPUFYKwWnHZB18A/6FLZqJvA6clXfJyIpufX5NkJc+BmfXP0KF/kfc7Z5L
 R0/wOiRpK8MRzWKRk3m5nUyddCP2AN93/z+neME9MOH0bHhF7DmRQi7IUy+AyXD9ayxQ
 9mqmGwYnPbpJZu9s/piFEtwDvrc59DgZTBsOxG6BRQ7WD6gML1XKlnHthw22/B3RshT6
 xV3Hj4LXPyWLVwQa+c/wn+5rHM5Aa32iN1IyKwvKDDYRKywwMhydbaXnOimMIPX7xLsE
 PBVsmxU+HXpHhmLhbaBt0AiWFaOJ8qpOJ30ohT0gUsCtbyfWPvYkEhBMtXfkfnFK1TJS
 RsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794255367; x=1794860167;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Zx9vuv3vdrGUOXhtJ5gk9kZNZFeFJC7ITsqFfkKlqNM=;
 b=HIEZ8AYXy9wd/2yrfnsLkgPFxlfFzyjABydh0ew+fFTI56kgQSZm4o/B/H2UHwI+6M
 4GGPVX7m24GVkP2o2hh5fVcJY3Mpn/noe8Ib7ek0aNWlta4KpcYcyOQMNBpbYOq1X+vx
 ZAkxy0Kcst/7sjLdrFkk6rq/ydpXF8ftjpzPz9KaJ6EZ9zyGIzpDIpEKSB02flJo4uNO
 hKaVyW6fxg0zmYZ+1k+j0R+DVBdybNuszNgS32IU59aVARddntJTDZSfqptCLoCddZTz
 uCughTh5o8f7D+68CsYSBuqF9CpTqBG9r05aMh1Pn3W892XC1OFnvtCnyARKQD25FJCF
 dEdQ==
X-Forwarded-Encrypted: i=1;
 AL+hErHMGzNrn7mkfLa9nMVNKTZfbXsxEhmo87KGFXOzY1ROKjooNtICqeYBSS+NZ9iYfx2HZUMVL1S7lhGS@nongnu.org
X-Gm-Message-State: APuU4Z8UcJJGvTtI0gtY4sQhrC/J2fksJPz5gSg+pGZbF3ypbwDDx3BW
 FyDMkIoE1IkbKYDIWIIOdbrGCRXl/+j4bFqNZbAnKeDJ+KasL/fZHNw19VHtHhDmqRSdbGvpwqe
 9Lkl3W17ae5Vf2lGbGF/GW7AkVy/DTTnxwWEhrFhgbXSw2z/0H2AP9G1UInEZmcKOsA==
X-Gm-Gg: AYBFou2StgJx6TQJDk/tkHrCGX6Lp4hYNHqszVy3c3loO+a6NrEW2NVkLDtA3d5KMJU
 2yE8XoOA29ikPZLNiuI4qkihp0sgW5ElksYILnerChxsuXGHTen7CRSg72YEG/0cI0x3eDicS+F
 bXACihOTV9Ia7jfPemzogS0bD7BrZuPZcaObsJDtTNY32X0H0OxfQy01uXYyHE7CehNY9AuVqG5
 lvI73votT9mWTFxTLL4YTB42By2FT9/E7gezwSqeqtE6QBHlm2gdq1W/n3qW3wLKpEjp6qPJ/Ql
 lNrSF/cKqaHbSOahgWzUrvLKtZ9c/GB/6gU42H7kLj4AETevK583MFHoy245hKPmDVYFnBECpgj
 dnzskrPyVW+lpVUThifU0Bc0RnP/8oE9O/rhe2NZ3GartuUAi7uDyjf6G39pozxyAzJ/+BMMhk7
 NuynfS4lxm
X-Received: by 2002:a05:6214:62b:b0:91e:9db6:c329 with SMTP id
 6a1803df08f44-91eef913dedmr12319926d6.35.1794255366710; 
 Mon, 09 Nov 2026 12:16:06 -0800 (PST)
X-Received: by 2002:a05:6214:62b:b0:91e:9db6:c329 with SMTP id
 6a1803df08f44-91eef913dedmr12319246d6.35.1794255366029; 
 Mon, 09 Nov 2026 12:16:06 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ef0316214sm4230756d6.5.2026.11.09.12.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 12:16:05 -0800 (PST)
Message-ID: <847a864f-3fc9-4e3e-8a24-433256c62de8@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 17:16:02 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 16/38] target/riscv: Add implied rules for Zvfqwdota8f
 extension
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
 <20261104194155.679241-17-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-17-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4MCBTYWx0ZWRfX+SXpnMrGUCpQ
 sCc30CoRWr4y5mnnY+v5/QUgKtVnQl8cDQaeXROnoQTl21Ilxq0uuBNbtbOJ+0t3/2Bu6J+toeH
 zUMEmOoEH29+VjCUdHnKb2z40Npd4FU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4MCBTYWx0ZWRfX3mW8UyL5kDbL
 mjhkZ4MVu6Zoxp6TQUpSd/MQ/EQHmt7GCEh34d5NIlF90s5nhnHk7cpp0XUFio1/Q6wX9jqTZ+1
 gWIX7tNE7RTL+ivR0zT0AAJzv+eHwP5Sm1/1c5yhf/SLzFxSVbJ6cuyxT3Yuti/9be0l1a8qdoB
 g5MFGPLUaI1UPD5d4ibfdCMqvGm1Fek4xAXeRd4pr5pJ7MQi4+gDDAApBbjy6MrxqNNdYasODUH
 ZzSpd+UakL9FznixxWWquRQ6S0/Kp7z2+25aH542/fS4Nik/g+FHNt+L6FLMRDpZNXd53sGg3E4
 dL07SvBXng8SoN1Xv13rcQs/okyom6uHqFBrPCZqjSCBQxHvy6HAj2Q6d1hpwqxN/DwrEabn/C4
 Uq9pRm+ZGcW2IQfRIKy6mBtvuZQC6cHJCZmh5ot6neAm2dC1vH1w0TLTQc/MEakVC7yZIMcrc/j
 O2WHMEEfqh7T9YRlkSQ==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af22a07 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=_HVl63z-bU3wyhxsAlgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-ORIG-GUID: NWjpFUpdeNofZLdKV48vrWtjRq_3pJwY
X-Proofpoint-GUID: NWjpFUpdeNofZLdKV48vrWtjRq_3pJwY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090080
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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



On 11/4/2026 4:41 PM, Max Chou wrote:
> Add implied rules to enable the implied extensions of Zvfqwdota8f
> extension recursively.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 4f2e7a8faa9..6c09685bd4b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2875,6 +2875,15 @@ static RISCVCPUImpliedExtsRule ZVQWDOTA8I_IMPLIED = {
>       },
>   };
>   
> +static RISCVCPUImpliedExtsRule ZVFQWDOTA8F_IMPLIED = {
> +    .ext = CPU_CFG_OFFSET(ext_zvfqwdota8f),
> +    .implied_multi_exts = {
> +        CPU_CFG_OFFSET(ext_zve32f),
> +
> +        RISCV_IMPLIED_EXTS_RULE_END
> +    },
> +};
> +
>   static RISCVCPUImpliedExtsRule ZVFWDOTA16BF_IMPLIED = {
>       .ext = CPU_CFG_OFFSET(ext_zvfwdota16bf),
>       .implied_multi_exts = {
> @@ -3081,6 +3090,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
>       &ZVFBFWMA_IMPLIED,
>       &ZVFH_IMPLIED,
>       &ZVFHMIN_IMPLIED,
> +    &ZVFQWDOTA8F_IMPLIED,
>       &ZVFWDOTA16BF_IMPLIED,
>       &ZVKN_IMPLIED,
>       &ZVKNC_IMPLIED,


