Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2279606B6D2
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 16:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eJGvjK3M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i7XzT3d4
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJZ2Y-0006pE-8J; Wed, 21 Oct 2026 12:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJZ2R-0006ix-VP
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 12:19:42 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJZ2P-0004nb-14
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 12:19:39 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LFTsYl141286
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 16:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s2yL8tMT7DVnn9rAVEtv7/qU3Qu8CEXSIryR/p7obe4=; b=eJGvjK3MCyK7HX9J
 QNwqq9GeWyzZ3ukEd7t+6aSbXzMZDYa1dmLrFPe4kE+YyuicO2Nn3P/7I05Ob/1j
 cFM8uGL84UIk6Dut6+OYmMz+KkHbknJTWivueus9/jO2Q31dWwmVomAy7PX6bsbV
 T/vazGJBgxj5jAVUdlklGNY+7ti0FE0BokcsSt2/QR2v4VE3Xbph8X4TD9uTrYaf
 6ilIf7SRXxv9I3X8mqvUfiIx5tYREZBktz6llstWScSjaNLszQNQsDp6pmX8wZxN
 ibmew/qXdPIVgyHFx6QRa5wj1AclLtSYKWXG6QhjCwd9NnwJ7MT0mqDvUVnEdRdO
 +QkUpQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex588thq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 16:19:35 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-1665200f4c2so1282458c88.0
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 09:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792599574; x=1793204374; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=s2yL8tMT7DVnn9rAVEtv7/qU3Qu8CEXSIryR/p7obe4=;
 b=i7XzT3d4QfVc6+XJ7tiEGeiNWEUTqFzps0ugesvq49g85+M4ZiVEdhuiHB5OPTzXhT
 Ii/FlMS497WwUqbiL0U2CzI+NMQRs+9Z8dJTIJFf19lljmIa3okKGgRHAUENMW+iqMkN
 ixlPsvKXh4zZtvojO9hurTQhPA70ezurn/IpB7bhtNukoW820Jg3CnN753g7u7a0HZ9y
 rAO2MdD8aojH1j6FXt1gWVtWcdQRzUFCCg8Feqs270nvB4ReSJvD/YWLz9HewS4cCWX+
 xCyNDmRVQ0zeAYdBb+HnuA6WgzqdhrSsmySmPWWG1Kv1x8rpnHhtPbl6bNlnijbZI17N
 UBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792599574; x=1793204374;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=s2yL8tMT7DVnn9rAVEtv7/qU3Qu8CEXSIryR/p7obe4=;
 b=EwnHhDELGSCHrCkmWGGjPTaNvX1KR7XihXoKds/Rve52mysMXHwwTgEMa3XKPiJeuD
 NuUafhFzv662IZyq8KEtWGVHM59EwWYDSqgQdNtdd3joXGu7/arfcxQwlEyDgkMwI7cS
 5F1S/NnVY3CDO8jUgbpY7uWt60t/21La8B1K8oo2FJ9pWu06kPh5mmgP2HFFyCNVU6EL
 3hr3cFUt1nlkQJhAmYNfg5d9ZfGZayXLPjCGLeKDpF0LjMhwpFlnuTPcAUlLdJxEky8n
 Kvp5cBAAvZlyMhW1lOfxUJyxbJBVElJyJcuT8X7vzlqtP+uQ3F3Af+w4u9F3etFyCEg1
 y79A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwueUjTJefKAyjY1N0ylLqy2INGlrL4ITSxijh9l1ua4klbEwRsuzp8IRKOzSfC/0HxwSkJUvFjYRF2@nongnu.org
X-Gm-Message-State: AFq9FYId6o/sky9rMJ/fHXSx+orWtVML4mqMKX7XzeaBHeqfGYM+3p0t
 vE73G29hPYb8FJ4OikLqSBPT4Nz+Z0DkIsLEXWWJ7/autAe8xi3tm6MYDtYwoMs7NplETLasz8U
 aQlQ0bKEjtKFQH0MVf36vwLW0iuSR62qFmQ8+3iGq6uewoTm8JnsqIrpknw==
X-Gm-Gg: AYBFou38M0yiMpLluuMjzmUa97Oin/m18byvtQu+tyGECxrV2gMsKKjPnyXzxI+bW2O
 ZTzZuWtFySGMDhDkQ1PFx7tH/i2xAIeG4frX4cF+9eakKbs8c1DxAFYmQSaLYlUQDPvR1zXvpOs
 yUAJiM2XWnAMqGV6rkxTabJhSmQp10ob4Kc+R1B3vuu8/o+6j+ks4vwXnT8Zp/CGclw+NPPwl7d
 ss3ES8l5qOoXo0t0LJ81jQdyXud6NNoZmMXwwE4MKjFI2GAyfnRj2pZdo0LxndXR9mBNYUAdZ6y
 VOxyckmzrZajULRPovCKf4iol/5gbKMhNxbE04C4A3DmYKxJLyKurS0ApgBm7JEj3GNLW4Hja5Y
 RCDook5stw2WBmB/4IkGvZx1eOVMfAUrOaQtpcPbQD+yURm8PaTYh7RijZvvK4SsBaRf9jQ==
X-Received: by 2002:a05:701b:280f:b0:15e:9126:c60f with SMTP id
 a92af1059eb24-190a632ef33mr2994968c88.29.1792599574135; 
 Wed, 21 Oct 2026 09:19:34 -0700 (PDT)
X-Received: by 2002:a05:701b:280f:b0:15e:9126:c60f with SMTP id
 a92af1059eb24-190a632ef33mr2994936c88.29.1792599573539; 
 Wed, 21 Oct 2026 09:19:33 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1903a74624csm6799699c88.7.2026.10.21.09.19.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 09:19:32 -0700 (PDT)
Message-ID: <7def4f4f-6207-4ea6-babc-7a62447dc22d@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:19:31 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/33] qemu/osdep: Add ARRAY_ELEM_OR_NULL() macro
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
 <20261021031407.24862-2-philmd@oss.qualcomm.com>
 <5e3635d5-1bd2-46b2-9f7d-78001159038c@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <5e3635d5-1bd2-46b2-9f7d-78001159038c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfX/6OffZw8vYlp
 Yfe8SjyIJ/7Hsj34YOiveYK2IRwDYs5kii7EXeTM2bPCXShjrRDt+pMBn90V/RfYDsh7wPF8vcH
 WnNrLN+UKiSDnx00nHlK/sptwBdF3mg=
X-Proofpoint-GUID: S6ni4j5e55VR1zo5ePsOWj0aCAh0Ihyh
X-Proofpoint-ORIG-GUID: S6ni4j5e55VR1zo5ePsOWj0aCAh0Ihyh
X-Authority-Analysis: v=2.4 cv=Ku7YSmWN c=1 sm=1 tr=0 ts=6ad8e617 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=BmFe0tvavUirwo0gUS4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfXzWCwXUFeXUsI
 kbBc8QQLVGh1T5ZN/pnFlH38s4nNU0ozxQLK96jP4ZQVkLsxaG1WTYlOryf71brPLnHmbuykZ02
 jLbvnjxcc6LEtN7FZ3YUBmWpK83+MlX2DAYHM0Pdsm3d7EjNtsGQ3s+an8ZFLRozydt5zmSDPoA
 w5M+yAGhs/mZyoepC0cPOSQNI/Ui5UjHfxm6BmeyPD0EVIvR1H7APkhx01DF9s7Osnafimt4vq4
 49iXOKFVun/goeJWtpIYQ4OF0dpqC97+S80eo8TvZcJWa2xLaCXtcVut+nGx2QwlfCSm/oA4Yys
 I+KtNt79XlzJWNl97sEBLT01Gxn0hYShKQ23kcDYPmVC9XbDgrUenBh+TiIg6izXQ58p2LQbWXe
 byyHinzvTscx+w4fAYUbAQYhqSlZBiL++KwFKgcCNaZ5AvceVG2NSCC4EQRuV4SVMv2mks2JODW
 91hHl3SWeqKHgCU3QcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210064
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On 10/21/2026 9:18 AM, Pierrick Bouvier wrote:
> On 10/20/2026 8:13 PM, Philippe Mathieu-Daudé wrote:
>> Add a macro returning array[index] or NULL when the index is out
>> of bounds, useful to convert switch statements over enums into
>> static string lookup tables.
>>
>> Suggested-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>> ---
>>  include/qemu/osdep.h | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>> index 1ec5b42230b..993c8ffde0c 100644
>> --- a/include/qemu/osdep.h
>> +++ b/include/qemu/osdep.h
>> @@ -533,6 +533,18 @@ void QEMU_ERROR("code path is reachable")
>>                         QEMU_BUILD_BUG_ON_ZERO(!QEMU_IS_ARRAY(x)))
>>  #endif
>>  
>> +/**
>> + * ARRAY_ELEM_OR_NULL() - Return an array element, or NULL if out of bounds
>> + * @array: array to index
>> + * @index: index of the element to return
>> + *
>> + * Return @array[@index] if @index is a valid index (negative indices
>> + * also yield NULL), otherwise return NULL. Useful to look up entries
>> + * in enum-indexed tables without a prior bounds check.
>> + */
>> +#define ARRAY_ELEM_OR_NULL(array, index) \
>> +    ((index) < 0 || (index) >= ARRAY_SIZE(array) ? NULL : (array)[index])
>> +
>>  int qemu_daemon(int nochdir, int noclose);
>>  void *qemu_anon_ram_alloc(size_t size, uint64_t *align, bool shared,
>>                            bool noreserve);
> 
> It assumes that array contains pointers only. If we restrict macro to
> char *, with a use of _Generic, it can be enforced at compile time.
> Another solution is to define a companion inline function that takes a
> const char *array[] parameter, so wrong conversion are caught at compile
> time also.
>

Original suggestion was STR_ARRAY_ELEM, to document that it's supposed
to take an array of string in parameter. This macro name suggests it's
more "generic", thus the remark above.

> Just a suggestion though.
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> 


