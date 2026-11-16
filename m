Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099D7606A335
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 21:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l4pBNdA6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JNBcP5Rk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xT4Pe-00017a-T2; Mon, 16 Nov 2026 16:38:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xT4PZ-00014K-Gx
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2026 16:38:51 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xT4PW-0005ie-Qj
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2026 16:38:49 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AGLH33N2245654
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 21:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TRcK94MSgV4h08vJgaqISlYG4TNoJWnA7+QKeK8QBS8=; b=l4pBNdA6WtOShDbe
 3N1X0dVR3uonoMYe7zQdFU0lIAohEiz4cHYlyfMnHeZrDeUMEeURFetYM8iagD+c
 3xQSQYM0ob/t6CUrskZ6Q7vglhuWK7yCRWRZ6nLV4SVqAUslD123HAHfrqRcctbQ
 nypXjsyCNPDZqwWi8KKmfwIqtb/Ifl5UmSmX89r2YKZ8BpxI3F+SItssmraZJUKd
 4Uz8kSfB4hG5NERwJINUchrei+T9ktEQg/GxD8JtFb2r6bTerNAn89Whlzmm4fDs
 6DCXRYQnrwF8Xm4AWzENSA/c8S0BaPbxngHDyTlJTncFJ8m9W0rfB63kiideMy76
 +GfEOA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m082g9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 21:38:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93e92aad34aso790800485a.0
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 13:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794865124; x=1795469924; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=TRcK94MSgV4h08vJgaqISlYG4TNoJWnA7+QKeK8QBS8=;
 b=JNBcP5RkcIqvQqCnpVoJJp5rAUbjaEqXJ+veOaWfCjeB5YaX8oSr1VBB9XcsA+9V/6
 MCjXZPRB62vmz0Wf5epbbSXk5rD/ExdOTbvYDcRh8eIjLc6GFbZvC+toC0Oue538MqOD
 8pAPGn+ZcuNPZApvog7sN7bh0hTHp9LVBsYy3k5KUPnbCtF9PJgFtjWa6XBNycPLeDqK
 HEbzZjSsOxQdWXh7TD+r0YE63erEpnMqQixV0sTLR3+QE+SL6nnJ+0q0JjMyXTRYP+IK
 ScY4+1VgEsS23NxDynTEC4xh2Hswb8UUEo9HRtD1Vka98bUmA2hRRJtr3fAksoH8LldE
 JCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794865124; x=1795469924;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TRcK94MSgV4h08vJgaqISlYG4TNoJWnA7+QKeK8QBS8=;
 b=xcnoKZw2KGXy0Y6UipW7Iw5r1UU7feJFVlZhnuUHdr76FV9D8F6E8xHoQ8ivuKb9vG
 lpHzxl0PkIDRuqjybP5oBgfrlaBlvmY3abL9UNzunwGOaQ2s2kkuIOuZfWgyn11Fz7RW
 OFOLE7L83+c7DmgL67KJ9OZs5HmeZd7whw1/rjLNQ0wGpLaLXFVCXyRRTDw6Kv1lZp4E
 lZpTunsVWPUpXzUOOP8ywpfO/wjbTKdB9a3ftHTz0AgUB65vkiqS6R6AgbO8r9A3dTfm
 Pc4nr7p+haxO/0XUA/Ij4B29nKqYC1fZhDMcxAYMj4E+me/A9EpLqPTPUeYVcQxwk8bs
 uF9g==
X-Forwarded-Encrypted: i=1;
 AL+hErFo6iEB2W2W38O0+PI4JXU/kd2xbIr5xxLoifUJs4BrlIC/mxwvHkXqg97uYw5nH6IdonaB7idd7zkT@nongnu.org
X-Gm-Message-State: APuU4Z++LaKy2rq3OlzhwsYSxI9vEcvhPnQcByej5P5ApxWcjlrW8dVe
 nJ9vVZqzkpmpsfLjN4yGZAvQi6Y5P/jnuCmAjFlFhhMVtu0C1ui+HaVUwMDrsAaHuj4ZwWBrO7S
 2ugHt+Ri961kOgeMwyG9lst2sYw5H1iPcbcJDTzX4v3VdcuVhsUfY0HZwMQ==
X-Gm-Gg: AYBFou01+0SzIP+pXZtmBCQ2hIPVC3eBLC7jIyxfMokPMUuyHND+x9s8t7kIVbJ/bfy
 u4x24T8858/0Dus8XAhlB8A/s0BZXTueMvSF6yWETQRpmyatdVPTU0Xz55zv18Nl1MfdCqGWRtK
 Xnv7qoR0pLCqtEQb1EsvtPTJjgFIHtL9f156iIyi8zFnXn59SIE9ZDhaMbYlkbMq5pu+VS0bTro
 BsIzwX3oTzXurLF9NvX+eMHixZSdgvqWRGDBmaipoPnudyrXEb/ePf6by1ORxgGqn4buBsb3Ug3
 1v6wcqptta1ouvWAq/wKIBf8HppcR9U/TGykuxuGMvQB7UQuG4i/2fb9ApYpv1TZTwVYGt1grF0
 oRA8yth+2UHNlYUbhjOsrRbJ35D1+vqfGiRjCrFb/BPy3I2iegFag3MqSDAs/gl/gtISSIPOjh6
 ms/ym4QW8=
X-Received: by 2002:a05:620a:a78f:b0:949:6775:4713 with SMTP id
 af79cd13be357-94967754e97mr819396885a.2.1794865123779; 
 Mon, 16 Nov 2026 13:38:43 -0800 (PST)
X-Received: by 2002:a05:620a:a78f:b0:949:6775:4713 with SMTP id
 af79cd13be357-94967754e97mr819393785a.2.1794865123167; 
 Mon, 16 Nov 2026 13:38:43 -0800 (PST)
Received: from [192.168.69.234] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c8d286480sm43358161f8f.7.2026.11.16.13.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 13:38:42 -0800 (PST)
Message-ID: <97118f0f-40d1-4a44-8080-d6df1bbb60e5@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 22:38:40 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] tcg/riscv64: Fix logical vector immediate matching
 and emission
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, qemu-arm@nongnu.org, qemu-stable@nongnu.org
References: <20261028143330.6518-1-philmd@oss.qualcomm.com>
 <20261028143330.6518-6-philmd@oss.qualcomm.com>
 <auOReLXT3EK7ITyf@aurel32.net>
 <8beb743f-41f0-4275-8baa-38e34e872f08@oss.qualcomm.com>
In-Reply-To: <8beb743f-41f0-4275-8baa-38e34e872f08@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4NiBTYWx0ZWRfXx7iMXNeijJz7
 OQL95CKFxNdZP8HYBMMlzC/XDgDbpZh3UCHWYWjlRIOuKkNVIuTmVZZyEBQ1B3JzQzVjLg3v2sy
 cAWoDMSgP9Fw61Tgb5FfH9xYvEVIFwM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4NiBTYWx0ZWRfXww6yo/Dz35KU
 z1EWk+VWOtWkUy89cubBmhGl9en/561vuoFwZlrIe9qwOoThioFCk3/mV8VaAk4qf7oCYb8MqcA
 UvmTZa/j8y/7hRQz/gsG5F0rgi7b0eRFO0dIlrAnXY8f6WDq/H+iyIJlVaOc+B5kmwta7ApNKDn
 fZj9gYCKgRkWoiiAD2wbm3WxEvXfKgBNPQcsMyVRnxmxG4OUEnu7e5n9rPNCIDoCbSb89UuDtZi
 L2JytfLTE3CDhj83vQSAT58exIJiu91hr+LqTcebZO6UYKZyvwlBSYmbS/O72kHUAU0JxJyCDmU
 M9GXwtqmf5ijztLOCk6MwdwDi1fkTysZk6BcoI8EolWU5cKi9gQE1O5V7CJzwReVj2ZjdG1Z9d9
 mt620rADC93C8cKAXCtYTvEqEwdrVyRDI7Lqus6GlsZz/Jad2b2Uf8BV4rLxwQp8QH6ZoAIACqd
 Bk60zZ3namwxv5N73CA==
X-Proofpoint-GUID: CZBNaT_9ry36SmzkJZ4m6ai3ypzu1aHP
X-Proofpoint-ORIG-GUID: CZBNaT_9ry36SmzkJZ4m6ai3ypzu1aHP
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afb77e4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=hXZgYZo4AAAA:8 a=U_ULVM1sZVwQ37B4evIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=37BJPeUnzxYkbV1yBC-1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160086
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 30/10/26 09:08, Philippe Mathieu-DaudÃ© wrote:
> On 29/10/26 19:33, Aurelien Jarno wrote:
>> On 2026-10-28 15:33, Philippe Mathieu-Daudé wrote:
>>> and/or/xor_vec always have VECE 0, yet their constant was matched
>>> as a byte element and applied at the stale SEW of the previous op:
>>> "bic v4.8h, #0xf0" became "vand.vi ..., 15".
>>>
>>> Add the 'N' constraint: use the smallest element size at which the
>>> constant replicates, if that element fits simm5, and switch SEW to
>>> it. A wider element can't fit when the smallest doesn't: its upper
>>> half repeats the smaller element, which would then be 0 or -1.


>> I am still wondering why not propagating VECE for logical ops at the TCG
>> level, instead of recomputing it at the TCG target level. But this is
>> how TCG is currently designed,
> 
> AND/OR/XOR are bitwise, so VECE doesn't matter to the generic layer.
> Indeed propagating it would be a separate tcg-op change.

Reworded in order to clarify:

   and/or/xor_vec are bitwise, so the generic layer doesn't track a
   meaningful VECE for them (it is always 0). The backend nevertheless
   matched the constant as a byte element, and emitted the .vi form at
   whatever SEW the previous op left behind:
   "bic v4.8h, #0xf0" became "vand.vi ..., 15".

   Add the 'N' constraint: find the smallest element size at which the
   constant replicates; the constant matches if that element fits simm5.
   The emitter then sets SEW to that size. A wider element can't fit
   when the smallest doesn't: its upper half repeats the smaller
   element, which would then be 0 or -1.

> 
>> so:
>>
>> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
>>
> 
> Thanks!
> 
> 


