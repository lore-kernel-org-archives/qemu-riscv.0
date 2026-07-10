Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F71C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:56:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiJD0-0003WB-Do; Fri, 10 Jul 2026 17:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJCz-0003VB-FL
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 17:56:33 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJCx-0007Vy-Vd
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 17:56:33 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK3Ssi1697293
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 21:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZI85Olt6Tqyu/rupFmmacxe2KIcvQ07Yymt7b+3xEJ0=; b=lSPPmBgIjvaz6ve3
 W6RUYuZgDp6agKvFlPaP6FAqZoxluQF9NwfO47Z+qWlM9HkoqedvaqinUR5Cg/Me
 /eUffUJTzHTJS0vh2NjJcf0wViSA/WWXAZhFdAJXnct6av+fqtozETq/c5T5PhKD
 SMfG+XrmkJPmwzdfmcDIOgTsuQt/Qc56xfZaLCxs1/KO4yX43+/yJYlOZg8hZ+NN
 x8/oyqhT11PisRg7X4GLijB5ppHJdxqBc3LKDFCwCSfMTPBgI+1jCHO4XGqdH4st
 rjhP1TYg6rrIuoSpzD+qtTVuS0Um5R1cT81uPr1zA04f3ugwJ/6fj82GkGTDRnLF
 uWZTlg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5djj20-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 21:56:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c19493ac2so15118451cf.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 14:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783720590; x=1784325390; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZI85Olt6Tqyu/rupFmmacxe2KIcvQ07Yymt7b+3xEJ0=;
 b=YF3PaUZW5hBieUiaHBLN//v1RPiEh0E+92bm54P6/aONHFpUNWFzdqZ7Aic0VE8FLX
 oUDyShHYk52V6kB7qfnvkleSA/lyCyz/Ewaeg/fIPUDJefRWmnrQHywEKqnfKw5aGNf/
 khe9RwzLdEnqDA2wU1IyWRBblvidlEPJ2mFtpK1xYIkA+g0JY9/exUdxA2jc3307cmPA
 9zXMWGsAxUGJKw7pJ9p8HL5agGkmOO9xZmdfo51kP3rN/orDAv/ftN2YPSOuvjH8xIr/
 zqRdJMlZIKXt9ixNNeJ4CiLq483mj0P8X/5CjhAnhR/O6z3sQSR9FJ7kxUN+ObHlcMVI
 gpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783720590; x=1784325390;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZI85Olt6Tqyu/rupFmmacxe2KIcvQ07Yymt7b+3xEJ0=;
 b=pi0Hf/+yV54WkN0E1smmmjrn4RXDzautWiDqiZ08/VsfGdhkWdasGGpCUnH13vZtL8
 P4gQl1IVPYTGFau7uAdQds0mr9IhHZ/iz8ucCW5sDeeW8vfmf2jz6WvQRSOU6ohkMKmU
 3PJBfcU+lgUC3gdYknf2mO1HP23PjWHDM1DjfjcH0Q24Zt0MMDsQjNrV0AgZ+2K6eNIW
 oTjgUooWn4hAfILLD7G5FJoRWkylF5afFdUoDp6HnaG44Z67x1AYCjUf9NTCzdH1bA2Y
 6/RT7D1a4QBVZZPFLgBO5lwdfLLoK11TAThDYeadtBN2NWXYf4CyaaR3Ztz20vn9FCij
 hcdA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrkuEJBOWqXvEPpifq9XAVfcFIixt60ExxGFzniDF32/Z3nIyqo2IWO0qEGScz6P1V1ZMVWhzXRkCA+@nongnu.org
X-Gm-Message-State: AOJu0YwmBc4jmMfTzyz+4EOUMaVHl1jLfvhTDoLSnNSWV1DW8R/QMGAW
 134viCtSRtjwl9jm2etAEacUPBJlBlnUoIDhQ8d/Fi3HUCtXejHuypxqShSBxa4emfbJDNp8sft
 /8ugfoCKmhHSEYYtiYeCa/ADHdXOvayKmoRVaAt7lcXovdduvQNRo8lgp2Q==
X-Gm-Gg: AfdE7cmCmhgGsa3nrz6yulaNMTlDhYBxKSv42E3hmlICPeMpwX19cSoBcDMObIAskZ8
 R5ZN1LgNfyMnZquM8/VxczGWtutiRYiff/q8BWodb6MyuREBGoJ0iU35e8G3/V/VuiLzF0UThfm
 Eoe3rvWtZJZ04se4oMcyVZS2jppx4zWQEZ8OAXIEd6UtK9rw5eeDiPh6HqDTYKigLIcCWOtG1/b
 WtJqO5Hy/UPUz8xaLqF0HJrPsiwmNmvDa8btgqpzCScMUE4jnKPzBUkED9Qace5iAoi/HFpKLyi
 5drNmepZNattsLyYylr/oij56qCA5SgqvLW/FXhhg0dTAYHbVeUA9jydUlYn4fWtiRCrWkv9o5Z
 d79zvePDIJzrtdb5OEdn0U+WMG19PRcgzxRlsQI6E6v8xUKHVwrDYiFPd/hnrHg==
X-Received: by 2002:a05:622a:4c0a:b0:51a:8c9c:7f44 with SMTP id
 d75a77b69052e-51cbf2af35amr7323101cf.71.1783720589781; 
 Fri, 10 Jul 2026 14:56:29 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0a:b0:51a:8c9c:7f44 with SMTP id
 d75a77b69052e-51cbf2af35amr7322931cf.71.1783720589294; 
 Fri, 10 Jul 2026 14:56:29 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f2d88698sm90807135e9.1.2026.07.10.14.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 14:56:28 -0700 (PDT)
Message-ID: <c65ac09e-b87e-4a0e-8265-c4ae27d0eb11@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:56:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/51] cpu-common: Validate flags in
 cpu_breakpoint_insert
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-24-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIyMCBTYWx0ZWRfXxJk3srb/OCs6
 DWd6jQAleebUue5PRcT6zxyFtyBuMg/uI/9ipHsT51iLVKFUETtVv5W12zoqHMxhyRq1wL3OSXQ
 x00yZRRb2NRMysSzMcDeMHU37kzlBJ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIyMCBTYWx0ZWRfX2LdaYUkqOaMr
 Of21zgTRXnwoN2yY6zd1kjJ6zwKdLGXG12ZNElQfN41fHqtZOTjjXxR6dXY84F4rvUPOMYOhS+F
 xNmvUWYXCR+qYBpv1K7p1N8JTam0YN38bSY5vEiQrrcMLerKfYAsOzD2XzXsZB7JKf39SnDVP2w
 KCiil/hq9IzQLDSXRm7aJJ5ME1Lb6GMKeU7h3/Q3B0v1rK00awAQs1EolMLDW6lmy1k35Y5VTnj
 9hlZZjENmoF/i6Yr/f8e9MnDz1BR4mSEus5lkSsBFCqJ7z6X/eGHP0JQKti8UF3uqDII0dD1w2M
 1AK/m9v5OprvXHcpOHiAKW2V3gLRljsbExE4q5371/LDquDtgDL2Aa9whoTFk5OpW48vfWNX1vP
 CcHVjtm0EcKILQqV41AJ+FtXB3VmzCJwV3tHgjFoS7KEWZwqgNH9zeo7dbyxcZ5mPXA7+LLkGA3
 Kzl/D0dMigmIrJj+SAQ==
X-Proofpoint-GUID: KN9u_rLUhentPIR-FaUVDV2U-gVohdM5
X-Proofpoint-ORIG-GUID: KN9u_rLUhentPIR-FaUVDV2U-gVohdM5
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a516a8e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100220
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 10/7/26 22:53, Richard Henderson wrote:
> Flags must specify GDB or CPU but not both.
> Flags must not contain extraneous bits.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   cpu-common.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

