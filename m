Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02533C5AC7A
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 09:23:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wsGnl-00032L-KL; Fri, 07 Aug 2026 05:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wsGnk-00031P-9z
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 05:23:40 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wsGni-00053M-Ec
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 05:23:39 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6777VOWD3477121
 for <qemu-riscv@nongnu.org>; Fri, 7 Aug 2026 09:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NtP4NnRpENy7kPPY1Vn0EUsspazM3KnylfH/1Ayv7oM=; b=jLIpJ9GnDfRrlJpH
 XV1m7tD66t4e7t+7F36VAU2MrYGDZk9NxsIg1fE56M18iq/lywNIT85pCPNoG6vk
 zIY8w8Dv+gyXf/gRYQuD0J1FXZHZezQDqVM689AW/cwfU5P5oJ0mq/eGgKO/drxf
 3mgE/LjpR8GCAVrlHk3Od+3/FOHx/7hOckuMMdljHSKJM09Lf4PyKtS9iMDKp7s8
 Crc3ab9Ol9JOpnWcnWRIaWqu8/Zzd82hXEnAaSpNFty3XBbDCP3kPkiQrimeRVUR
 0XrvgfIbiFDD3bwqHhEbH4VTSLZ0qUk64lof0oh7vvMSphw+m1Gwu7QH8+Tbhjcd
 BfKpSA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hb8d6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 09:23:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-52ce3c7cb2eso47446181cf.3
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 02:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786094617; x=1786699417; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=NtP4NnRpENy7kPPY1Vn0EUsspazM3KnylfH/1Ayv7oM=;
 b=jR4c385hMZ7iABuqeT6res9z8XbHzAAzMV23elso2II24Obc1KSUfbmzsZ+xVoWUsv
 7HOh5XEjuozE6kYv/IQpLrI9z5yHgetrXAduBIa27hSCJaz5Thtk0X27m+rnTcI0xqWr
 9i8b6WMlypoo3V4jsH1jK8itaB6dagA6+G9nxLEWMdoEWAN+HGhKOlSOq1QiEYGg4F8n
 o3R15L6uLknBN8TCCYAgO7KSI5bnwhRg6mZUxIb5BdOl7kXfYbaHPGLss2MJmHbrYxDz
 um0i9lDfhWCkLW78ZlY6DGTaJy8OtKKXfl1jtpMgzIpeHIj8VDJ5Ecov936Fsdgibmfx
 /lrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786094617; x=1786699417;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=NtP4NnRpENy7kPPY1Vn0EUsspazM3KnylfH/1Ayv7oM=;
 b=OqGcme7eKlfYQkFHXaed4lcIvj+15kYOgxSdo8+VGPWNCEtmycmnynN7aKc0f5TK51
 WLIBvCnKgUlq2npnjvtblmueRox/zIwVXRfYNhSO0DCZZymzZKtTFILL94crIQmzBmce
 ktSGcybM1g/bXv09gg13r7XXIvnpsL5Ht+pNitqMdGr3KKVQyezbk2NeMmy0fqdQ+6EI
 y7V7kMerlS3tWw0YhLBzgZCNDXphorlpYxKnSOTwZbTqXrAuoAz41pUkuQyP1iGDkUs6
 s+lr/On6+ABTDTOeeVTvDFZTnUdC56xPoGiyRReuUSoiPGTTBFOeG9hzcbT6CJz/YgTm
 MKGg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrZV5DcZGJjkmMH4hNze08kA/xDE84cuNQP696l6rJJ0uhyUK3kIfkwomzQ8gHgC/b7YKD6IoystFSC@nongnu.org
X-Gm-Message-State: AOJu0YyWdu3chuXPE8C2HFqYJqrpEOLmh0yxrlrIahe2FpfQi+BAKE6H
 Hu9kWKLpBdvUtwjPTv2s+pTEHmj7DQIjH1eMhfFsCAycY61lvTq6W8wCaPsRy8U7xnZWQL/0KPD
 u7OVtSTEk1qnoWv1mfTU2r/i5OaAXZ3IXeotUxfY2yJ1kK4tbCesIIuC+rQ==
X-Gm-Gg: AR+sD10up0R+1IlI8ijIL5k65xRn8ChoP0BkidPUplGdBrO0sezHhKDhw1/0XdFD579
 raOt9iNziwqlriqJQe+qowRkpgtpOu4RsaFuwIa+qZSm8Gn7DCvFFxjmApIKJyfMK45cJjYygqa
 uBYi6nSTwJt/qcY+JNyHKyfVjX+7yhBc2f/cRDI8hTfyjeYqG1orbYwX5DVLLc+78Dtcuc+jN/c
 VWmXYsXPwOzBfJrQdwQ3hWdWtAXsZw4B2mRH6jV3vdCsmtbAyZ3RTjfuC0zI/EqKwVfWLAHJybd
 C9qiWFRdwSyfkJ0E6MhXbhN1ZVFRZjd671+dQ4HGD3X4zAcWrjJRxbyulQ2uAnA6PwB8wUPxWmB
 2HniYK83CmlS7SvlB7topFaSTPb/HUpjonSAL
X-Received: by 2002:ac8:5d53:0:b0:526:d595:c7fa with SMTP id
 d75a77b69052e-52d0b21b43amr80037711cf.31.1786094616957; 
 Fri, 07 Aug 2026 02:23:36 -0700 (PDT)
X-Received: by 2002:ac8:5d53:0:b0:526:d595:c7fa with SMTP id
 d75a77b69052e-52d0b21b43amr80037511cf.31.1786094616592; 
 Fri, 07 Aug 2026 02:23:36 -0700 (PDT)
Received: from [192.168.68.103] ([187.11.154.152])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-908a92fe515sm4756816d6.24.2026.08.07.02.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 02:23:36 -0700 (PDT)
Message-ID: <be5d04a5-1ff7-4654-aa48-e53d55bab914@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 06:23:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/riscv: Allow UXL to be 3 in mstatus on rv128
To: frederic.petrot@univ-grenoble-alpes.fr, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260729083941.103646-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20260729083941.103646-2-frederic.petrot@univ-grenoble-alpes.fr>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260729083941.103646-2-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CHlP9zDwEIo9fIuk1xnvIxkAy3cZQuok
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3MCBTYWx0ZWRfXzdW1xi8ilxS4
 LPw0LgQV8qeOajk78MRC7HNLHT+NpOcwFM4mAyYpWLkZhC0fS+ASbCHTOUlrTOAUw+CfM9X6tUs
 l7NAREHgQrPvFjhjGp/JxNP7bVkjJGqkH+yRevCelzjPs1XRbK9cT/DdnqdQr/IhoQdNhKJpkAW
 fOU52frZLh1O228K+7829PeTdYxTwcdQ90oq9ktCFbu1rt8LgBm+K5wg823kV2lQFUMfPoBv9Fe
 ZMg/vF3IfYapv0ZlXb7DP9Evlc4Q+XdYaMSHo1AQjHe8FgLBLb3VbGhzFs2oWAi4rXAtp1TeJH+
 qeFWO4ezGMRNZsdN3taWUT7JSQlK0kptpNfMmFn9HaANa4PJs0GDxEvtX+X/EzmkSWCLQiNSOZx
 by0Zvi7mWECVRAUXS1/kA7nJId4zOlrZi7fqLM61moJYHs3fueLdd4C2+RURhAU+4QOHMQ0xb90
 miFymPp6auuQZ68FOMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3MCBTYWx0ZWRfXw4YBdltNcHgu
 jy4C3Ty5gDOilKR7NE7Ur8CHH25wPcZGR0lez7MaJb2+9I5NDX2zZ1wl9laAnQEIt5owTFrzq/e
 p7z7+t7sOJJW4W7Nph+c4bIT2luLeWc=
X-Proofpoint-ORIG-GUID: CHlP9zDwEIo9fIuk1xnvIxkAy3cZQuok
X-Authority-Analysis: v=2.4 cv=MbpcfZ/f c=1 sm=1 tr=0 ts=6a75a419 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iMfxv9gflPUPBcmW7/Gq5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=swibrC5bZXBqt7sKYMAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070070
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 7/29/2026 5:39 AM, frederic.petrot@univ-grenoble-alpes.fr wrote:
> From: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> 
> Valid UXL field values for mstatus were restricted to fix a
> reported issue, but this inadvertently broke the experimental
> rv128 support where a value of 3 validly represents 128-bit
> execution.
> 
> Update the mstatus write logic to permit UXL=3 when running on
> an rv128 CPU.
> 
> Fixes: dcd028517749 ("target/riscv: Apply UXL WARL handling to vsstatus")
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/tcg/csr.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index d834b77714..5eeb9f0e0f 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -2014,8 +2014,8 @@ static uint64_t riscv_write_uxl(CPURISCVState *env, uint64_t val,
>       RISCVMXL xl = riscv_cpu_mxl(env);
>       uint64_t uxl = get_field(val, field);
>   
> -    if (uxl == MXL_RV128) {
> -        uxl = xl == MXL_RV128 ? MXL_RV64 : xl;
> +    if (xl != MXL_RV128 && uxl == MXL_RV128) {
> +        uxl = xl;
>           val = set_field(val, field, uxl);
>       }
>   


