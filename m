Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370C1606A31C
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 20:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MoUckSRd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eAu013qE
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQWA7-0000oC-3t; Mon, 09 Nov 2026 15:40:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQW9o-0000Qe-Cz
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:40:04 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQW9k-0008PO-Ep
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:39:58 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9JlJld1172302
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 20:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e1kJnBGvSYeg1cNVZAX7y49hMvH6+Fuu0kAyMBcsjUg=; b=MoUckSRdtF//mdz4
 y6Loz6jli4V1eat0EHSAJgaFHIDDpQqCWaxJQcELuRURvVUQbx6GHeBknxEvWYrw
 rzYnGhNsHvu7xo6DA6rrI9Q3/QoUiqcOhDNVjkpBOGOIFndkPlP3JgqG9IfE/fm0
 fmjXU2jmNAxI5r8gCdXvmA1EaKYGH0d12P12olc3Gz0TU0c7NwFeIOdRH6bDrbJm
 oRIPT6XvZM6mUo8DCThWDHUEMi7TKpi/Bco6Ld0FCUnneoUsst+OzuHjArjCsnaF
 KPmqgJ2VSXuNpTkNEtCywofdPAVJoPHqmx0pplZUBD+dLFV+4/DXYKL2jn8Zm6EK
 v4Chbw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucapa5vq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 20:39:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f32050e72so255406585a.1
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 12:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794256793; x=1794861593; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=e1kJnBGvSYeg1cNVZAX7y49hMvH6+Fuu0kAyMBcsjUg=;
 b=eAu013qEj5IaYfnFWd5CpFXgJCGuXBDT97bZGweTpmHSBWTufFe/aRnJGc78g9Budn
 CeWdqf/iIJA9TTPiw2XIQKHFd1OCIPgSr867EYveakrGVormIQP5kpYTLrZBnxrOu0g6
 ze8C91SDvumnCsgAM5QfDz+Kg6LaVWu5hH4PUPfQPGBjofjGJyWGrqtdr4xEn+bRIuhk
 UwX9Kd1CnUJVR8aM1sWwV87cBZYaYoHN28B26JhgdQAyU/1lBCJ7QHxLy9nInu+CwYDU
 fbE1pQE7uj7Bh0PQ7NsYW5pTSawmHBZCRoc7UcAIQcR2kbBGhB62EihTmgK+tZ/ckR+9
 aF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794256793; x=1794861593;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=e1kJnBGvSYeg1cNVZAX7y49hMvH6+Fuu0kAyMBcsjUg=;
 b=S3Bw6qGN53f9ilKjumKcnAAvW44/x2A/RUQq0HTOY2KmAApedYrlMeStguQOOuFebz
 ahd4pltbrZkFchB1W+cd5evZCWO7nOXofnxaV76J+mDQ/9yqZxEsbgrP7Sb53QdEY1I3
 o25yYBRPUIcovXZz27+TCeuBmHENpjNfUIDZ/3U2TXSt7L0u/S8b78inbyfQG+XBKWX0
 yRaL2Yi+D76m6UXJA0ZNv64FKn6tL06kHYNlcUlKl/zh4sUllL2uK7fFU2L05KeIxy6+
 BgNXKx5ceGGcM0++YFQZOWXfDjYTBN10TbqpwJcRoC3+fmtFzcvNVZVnk/dfOZHUSPSF
 DSKQ==
X-Forwarded-Encrypted: i=1;
 AL+hErHBrdXFWaZixo+pqnhHdE03GXIZaLVLuRez4WiCZqu8QKrwCNgOjrirAH4bat27gWzuth9pGy79nWw0@nongnu.org
X-Gm-Message-State: APuU4Z95ApRP9sygceiaf4g80NSN9Evjw1giWPe7Q6Ea8GktdGN3Qw/L
 wz70d8ehdzBEK7qumMImfsVoh5cDHZYN+hdOWEeqIwCMaulzRz+SnQUN8KV48xg2dLX2kjOAvoN
 UZ+dEyCz+2wazQn6He7tKuoy9FXiNWglewlTdaDIT8mKQOi/bOf2J5Nny2Q==
X-Gm-Gg: AYBFou3Z+uaYxxo8OtaI5fSzg7UIOR4LRN111MZcGodTLS4z32mVF20jzfUwqvagzlV
 NGvKDajysRjpcdal1Z2QmEPrNkVnsNVTj95xd6JfmI0mgRE5IRrFhvx/HCZmL7/rz0nchSci7Ii
 wuFCq3DQybnuhmWQLWB4h8g4K02kQuo1fu7oPQKBZBxMxTNQMQy51On1j2FJ3s1k8gpTQxNnl+y
 +SFQk83L8+UR572xEjAQQsDx0s4eYliTWn4SU8ujzi9lS6WXbUwV6RcJ9VgUWuxEw/FnIPeZqGQ
 Lg2z6lnHApc8iDUXwy/HffNAWv0T8/FApYpfcPfuD6TOf9A3c4qqfl0dWCNbybQT/MI+FkRFWk4
 DJoO1PfAqRihXXYdEHUPBLVs8rCLEoQoCpm6GYziNxwP6qdPYArrTJxWGbgzFoMbznncgZyGRo+
 5kevDH26K1
X-Received: by 2002:a05:620a:6f0a:b0:93f:3829:8492 with SMTP id
 af79cd13be357-9479f3f45efmr94412685a.78.1794256793342; 
 Mon, 09 Nov 2026 12:39:53 -0800 (PST)
X-Received: by 2002:a05:620a:6f0a:b0:93f:3829:8492 with SMTP id
 af79cd13be357-9479f3f45efmr94409785a.78.1794256792697; 
 Mon, 09 Nov 2026 12:39:52 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ef03161dasm4759086d6.6.2026.11.09.12.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 12:39:52 -0800 (PST)
Message-ID: <9a876cdd-45f3-4016-a484-82aa6184a00f@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 17:39:48 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 27/38] target/riscv: Add implied rules for
 Zvfwbdota16bf extension
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
 <20261104194155.679241-28-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-28-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4MiBTYWx0ZWRfX9iq/b+CILUIs
 5H4bOhn40l9TMXK0jZUBnxZ2kSW+0ydYpwgwoO48a2y10QH0XaKdLFqZYccvH7+PAQ9HdUX+Q5F
 1lQ7LXSAoANfKHdKjpD83fJ2u9MShAs1xKRjyGw/FG2wZmNwuGWy/dpmD++U9dIhl1tAule+42o
 d+1Z2XZ7KXS6DACqfMkVq3dLfw9rQ8JLTCi+z5nCeCOyDfi+pmJh45iZyuaPzRolfNpmPkRX+wF
 98XfX4WtvG25WqQkXIlyIIGreb1dKh3RQjmYBq4IQrWiLqVQo0j1ZGLe+wlUeB/AOQvWqT0LQtM
 cjSWCZ70rTOE8vuLcCQ8hnTTGH9PpNjf1T6INfO2qb8TaWm9+cRFmOWLHC3cM/RVdt2EmirgwDr
 FG6jQiPtmb68sLwTM7MZNre0MIpSV1pAnmJSKxF1amiAaa5jAAHoaQIsIJFJlriyfYpZqNmjtQM
 WXPxXiCF1r4ooKDFXaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4MiBTYWx0ZWRfX2eIh6VrTPk3e
 iFrP8M6DoKj6i7MsMxFVjtbF4GPa5k4zT8gltfOw96bea4LDQWuk8ei2gE2Au8RP4EVRYlcJRgk
 3dwhRAWdOltYb9qZr7gzmvW486N0fVc=
X-Proofpoint-ORIG-GUID: 3cB2oRMlwQ1UWp4WULcSJIjalsMT_KOJ
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af22f9a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=l4tOesgx5NEs24bu9rEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-GUID: 3cB2oRMlwQ1UWp4WULcSJIjalsMT_KOJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090082
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 4:41 PM, Max Chou wrote:
> Add implied rules to enable the implied extensions of Zvfwbdota16bf
> extension recursively.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c33885542f5..566e2e835ae 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2890,6 +2890,15 @@ static RISCVCPUImpliedExtsRule ZVFQWDOTA8F_IMPLIED = {
>       },
>   };
>   
> +static RISCVCPUImpliedExtsRule ZVFWBDOTA16BF_IMPLIED = {
> +    .ext = CPU_CFG_OFFSET(ext_zvfwbdota16bf),
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
> @@ -3115,6 +3124,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
>       &ZVFH_IMPLIED,
>       &ZVFHMIN_IMPLIED,
>       &ZVFQWDOTA8F_IMPLIED,
> +    &ZVFWBDOTA16BF_IMPLIED,
>       &ZVFWDOTA16BF_IMPLIED,
>       &ZVKN_IMPLIED,
>       &ZVKNC_IMPLIED,


