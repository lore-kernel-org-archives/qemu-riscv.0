Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323BC606A31F
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 16:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oXw0Okyr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A3ancS1P
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJZ3O-0007WC-PZ; Wed, 21 Oct 2026 12:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJZ2s-00071z-7P
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 12:20:09 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJZ2p-0004pU-PL
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 12:20:05 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LG3Plw900390
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 16:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7pVccf5x1st1Wtz5MHwGIaf6N9mPJdnj7/Zh0VgzTGA=; b=oXw0OkyrOdmSwXPh
 m3n47YaZM/INfwM8pTx/O/UshzmiuTlraIsVqrhSXC/tPRUP0LE5YQAs5CyiE0lP
 naTc4Mj/OPtR6OjEfT+oooUmHHExVJhPFdrOPgmpTUQM9BmUpNik/Mfza6PuyspO
 Swt6OgZj9dmVK8VyCMaSQkb2TG4wMOB5lBEFwdIenIirY7Q35dsqditz18vQeBBE
 vcQVauAdu6DgzqVEf0pQI9wRh5xkH1IABdfDCAUFVqdMX34ugNItI7z7Avuh/al1
 T4NylFBS0dywA0mYsbfLu6SMJ9MZoNzqLxJH1eqVQRmM6GBn+9k20xty1hjY+EWk
 O2CUHQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0k2g2pt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 16:20:00 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id
 a92af1059eb24-1383723dfddso1504241c88.0
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 09:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792599597; x=1793204397; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7pVccf5x1st1Wtz5MHwGIaf6N9mPJdnj7/Zh0VgzTGA=;
 b=A3ancS1PAYZBTlIc6xKclH6wOcB6bju7z9DRvlKvJlnlAAjIIfnVMGMoHMQGDv3J79
 HiwpTtqoREzCccZEXLtBvrsAnm+EXbgU4RgBsOb/K1KZ9iTO8zlwyEuPOFke5+UiiAlD
 vWMVMbP95vq/OC0hSlgFyLf3uhLf8RKBmQJ8jLEHfo38SHeFJOY3VSOqIJYcCJgP/s/a
 +J51svtFStBnedIb8+nXln7ptIkCA/VX7DoaBnxZ6Uxs3LUDHZ3JiSDC1zH4o5r+1+Hz
 8Mr8ppJrp2KRqeryMujbkUSEPOxHaMfk2lFN4LKbW4IElCJf1RHwp2oxBsuEuMwUvuvY
 Ixnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792599597; x=1793204397;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7pVccf5x1st1Wtz5MHwGIaf6N9mPJdnj7/Zh0VgzTGA=;
 b=u0D5tdvB248C/JpF5GTS+NIiIfuOaWlYLg9jm77TWnCEWGobI8E6u3Dc7um+v4a3pT
 mcrKk+Xt3WL56AkaQYX7hcjDeeLWCGq8iMXNvQXFFl6RSJwvzJPL/2mC60CUzVoqhHUg
 pCRx+ZnZ/Vkwq2xYJ6KE6h8hqr0QZNfWUje9Ln9ZWM+SgIuCyfNjhM1bkDt0884lPu09
 dbzKiacNS2KQP1+kTCiC5NBk3IcQ6O7KgsuA/KIDa3aMZEsHN19yblFbP7iDRYyBUpud
 bMZAHV7fJq05blnAMN94hPN9doxCyzCmzj8uP2Ll/X8Q1HzSPEnS7zOUrdnq05NdYHg9
 8V8Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBwBk2FFuh9C3MSgScjFT7VhcDPa7VjrOMTBSENmPlG7IWtLAf3FfWquB3iLvDvuuP6CjGNrihlpZoJF@nongnu.org
X-Gm-Message-State: AFq9FYJ0hQwtmxpVm+2LbLZb9b02NK8NaHrjdaJzFgNOTFreM4jPZqvP
 IM+GAh3aU3zv66GppK9svt416DLGlPUtXb6R4cxmef6KNoskDKv5Q53Zy8hrR1S0m5kMrIDBmlS
 FzMHEXncwLvZexbcYPXG8u0tJFdX+LDyFR+nQgeqQ0WZs7SYH05kbTD17bg==
X-Gm-Gg: AYBFou2nJyTgqIHweN0c7/zYpqSXbO2+B7ennn36BH9MbSbPHp7ObPb3kHj9pXBC0+9
 sDsApLadGcHECRdps5Q6bLKF139xAOwvFLpiC5ievXsIAAA2Fa+BgqL94yR/YUxuthvSeZ3ZRZO
 k6pTsEqDUOCGrUqtkaDKHLZxfYZ9fAc1xG3W4st8uvpOVaKfThzOc4SuPAgTqlneVtR8gr7VWzA
 RrxxuGe5HvgsMPY4dTcE69Z2kWpXoaueZeBwS+lRnicaXLkuESuAy7l468PlnJUpQjQidnHLP7J
 SoYXFo3Vt1Qly6FrOipwdCYki0CX+1W5l44ZmjbJUTDhIU3OPAflerD46M83QbXf+9Ndve76vzs
 XNmKlnKd4lKxp5eqxcGcPe0H7/TVw7ITqrG4L2Hs4bo3hiQ8ZK+Fbjr/AUYs7k1rX8zOpEg==
X-Received: by 2002:a05:7022:387:b0:175:525c:90b4 with SMTP id
 a92af1059eb24-190a50ef799mr3480671c88.20.1792599597115; 
 Wed, 21 Oct 2026 09:19:57 -0700 (PDT)
X-Received: by 2002:a05:7022:387:b0:175:525c:90b4 with SMTP id
 a92af1059eb24-190a50ef799mr3480621c88.20.1792599596537; 
 Wed, 21 Oct 2026 09:19:56 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1903bf5d0a1sm7169316c88.14.2026.10.21.09.19.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 09:19:55 -0700 (PDT)
Message-ID: <c5c24e21-0836-4bf5-b5fd-848d276ac7fc@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:19:54 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/33] target/alpha: Use a static table in
 alpha_exception_name()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
 <20261021031407.24862-6-philmd@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261021031407.24862-6-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX17wsDwUh38gm
 nMSQV+qLnfJMsO4nOWlatwtLrLLyTg9Hl0SXix93N3HxVpBNDZYn+moBRcnyWf1kcEBxAqVFg19
 c5sSUPtH7TiTB4J7M524IXynC3ZqfFU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX0x8T+SHe1STQ
 eQlGGRe0tJRpG8JJPS6hiJ8mCYAJI6Rvz3ZN8ywKU+roaSbF2FUoAqe/6Fh/aZOQUeuYFRhPDdf
 /Y1H5WBZ9EiAiQ+0D2wH4QUNrcxQ1VVSrDf+qfRBEDp+RkJfY/t4cQuOY7nWbJ9wsntpVluBa5M
 Ysg2qtUDtpC7JxepAUWFysFOUb15IoI3ijNUQVW1NxfNCTSsKP4nxYcaVDzeo7GmLW1w5dY5qrp
 P8mOuMAT3rdyrj3yi1XqrhqBM5iNCQ7ON8BWN2pB4jP43Z2vBxsnTiwjzc4iTsuuYsvA53BKPqR
 nps/fckYR6QTSGX1eVypHAvntKZDoE1avntBn6ZKhuT4/15Kqt/+hJu69VctkUHiBxznhsA+mOO
 SpebikdxB9eNPqATd/oerb1lrVzGJ/vXbOQKxZzn2Zmbfj00DAgq1cjhstam9DY3nx0iEqLjw/L
 T9sWmowRxh/Qyv8khXA==
X-Proofpoint-ORIG-GUID: wLAXnlNiOpbq_SkmljVfAh0rIfHbju9F
X-Proofpoint-GUID: wLAXnlNiOpbq_SkmljVfAh0rIfHbju9F
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad8e630 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rpH6MXs8h_YZi1gZqq4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210065
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 10/20/2026 8:13 PM, Philippe Mathieu-Daudé wrote:
> Replace the switch statement with a static lookup table.
> 
> Suggested-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>  target/alpha/helper.c | 54 +++++++++++--------------------------------
>  1 file changed, 14 insertions(+), 40 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

