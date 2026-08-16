Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC62EC5DF6E
	for <qemu-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 09:21:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvX3H-0000aq-5i; Sun, 16 Aug 2026 05:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvX3B-0000Y1-2t
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 05:21:05 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvX39-0002sQ-Gb
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 05:21:04 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67G72Nb02630383
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 09:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /4VcSviN9lNHYtMy/UEYt0huSASONpZT6+Pf8NbynfY=; b=ex1+fH3dmUtzy4Bc
 ZkY3XafrZhS8IHmC5X89ixPjvh2js5OD6T5spXYmkJB1qTt9HVHECGhrv3MJHplz
 4hEWi/4k6O4lNgtFBP264alhP17r0IYN5Tn/MFK26rXpWJSsb9fFXv7gVTzjH5we
 0XeRj4XFhLQsMD0jpC9bRCBLzm1wDX09eB7Le9tTPIvBwiPl4ft+X8hsinWunALH
 AvmWxerQtNInSpmMyf9mZ5VExgd2xqczfb8+bMiQmNcTi/8nZyq/eWBW6jQkyTfB
 EVQE4zZ4bqrTNv7nXqY0iXUKjsS0TsUWnL8vJ4BKJPt+vE1q6YEsfN3pstLLnZr4
 eGqSHQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghk35rp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 09:21:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8ea75996387so45898916d6.1
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 02:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786872062; x=1787476862; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/4VcSviN9lNHYtMy/UEYt0huSASONpZT6+Pf8NbynfY=;
 b=SpyRanCI6IXx4AY2FsnFkJghpF2D56RhuDmU74iV8TlfUw3ioTUIzwliEUuC4nJ8dT
 hX826NFhLWz39P679wxyJE82/78L7sAKsG31kA03ucCkmvb5JkqQQgD7t4HW5vhM/N+B
 0D6yZF5kbXl3nmHF8VLj2rytkpNtOoIU5YvuZHWHqicF8frtcjP89FHtoRR4D5SsGWmw
 GqJSL5sL5EF1OPlaIN/SwdM9921BBiyrVQFyWr0Iz4RoQ0SC9lGA6ywZsQd/lThPOMe+
 ZhMxg9z+13cpHuL9zWMwQs4GdVPFy/ixWHtstSVvbxE93LVweSg//m81sJGvg10XWB7C
 ElNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786872062; x=1787476862;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/4VcSviN9lNHYtMy/UEYt0huSASONpZT6+Pf8NbynfY=;
 b=RKreMkwWHBAuXwRs7mRG/luuIkBL3fxgmbbiR4Ph/DxA+aiSTanAOcNDzMP5WzXBcP
 INYGg0kGIzrQGB5oFGdtiuw83Q6HpyRBMjjUcq5qiY/vz9KgvIeJcyHEOD5PRJw0qcmy
 o6Hf1SNr/hJLlHhVZbqT64nhx5BIGsbCzthDHY2Zfj6Upsw/J+08eXqHeFqtRyGYXMpr
 FvSzzsrZuLF7XuIaXaSxmgw6KFpTMVAYCUJ+6zPPjkBk4bu5Ewc5xUHjbv7X0JIxb07m
 ZnQRQyoDBsxoK3LZhNhAOuY7PM63dZlxUCIOk42gFq9ACZ6Yr2jKrPNdNB07a90vUM/s
 owAg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqbefoTzorHBwRyyoAmJkwCi9Aj6Q0TdPaYE81+2n/PMiXbQNOBsB1oWxBxQ5a9uLPZFg/qCq9k/MKE@nongnu.org
X-Gm-Message-State: AOJu0YxsGrzKk6Yl5DKSmUgosjCgiGLzNsJR+Vl43ikE3BvJaP9o6EKq
 /n0pYUgYqj49+kH2RENcscWIS4jceECQ7fnQIrH0RxAR+JIq4Mds2HcAPI5OqqXBkQVEK+ey0/A
 IjWvQG8A1Pv/f8L2x1ktnLM89xXArWdYbXd+tdIqlO9NLxVrXv8Y+xeTZrA==
X-Gm-Gg: AR+sD107b32OJgKFyBVuaZvQzwgP910BN33qRFjR4vyBCJm5fDiinpAT+TikdPCqhFY
 IHJc6dMJzuFDhIyufdonOwGvNlsMCDbVSOxS+PALYj7Zu8xIDJNXbu6i6NAGcZp5se1WZIoBDF8
 FvdO8wIodi0eTLpusmn9S46BpwgUAzyoXR7rN/4gQ7FMXGs4ESimEDyV3I76n990y3C8w9mWWrV
 bsOURat/rp1b7eygQJw3XBJ7cU48D+py1EyqF9YfvqnEgbFlHV2w3r1mUhAlGcuJNE9Zcdk8sfV
 2pB0r2B3XsA7wukOGsmRWJB0QVw4eDnQCqZ9UGGba7rBK/ZWAmXKL2w5EjWRD0cRuswHTSe8SVq
 teM9MhzliahrTYZp8bEZJYKAqiP+bhMs3kXQ=
X-Received: by 2002:a05:622a:2447:b0:52d:9dd9:63bd with SMTP id
 d75a77b69052e-52d9dd966e7mr73259591cf.10.1786872061734; 
 Sun, 16 Aug 2026 02:21:01 -0700 (PDT)
X-Received: by 2002:a05:622a:2447:b0:52d:9dd9:63bd with SMTP id
 d75a77b69052e-52d9dd966e7mr73259381cf.10.1786872061364; 
 Sun, 16 Aug 2026 02:21:01 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996094fbbsm44585105e9.0.2026.08.16.02.21.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 02:21:00 -0700 (PDT)
Message-ID: <f7fcfe1b-63db-459d-8494-20ae89c6d94b@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 11:21:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 13/18] target/riscv: Move PMP_AMATCH_OFF check in
 pmp_hart_has_privs
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260815203730.1468365-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDA2OSBTYWx0ZWRfXwT5IAIoLVJjQ
 nvfErGfM0v5rRdu47+T2EOD8oHgHh7eEzdfHT387QD8I8QxWMn8TKGXwaL+YLh2OkrwiO9O3jW8
 m3MPpiF6hVSGfYOB8JRXh14oUXdBSjU=
X-Proofpoint-GUID: TGGysmZxfz6ir3zv-0okI6lf-hJQUECb
X-Authority-Analysis: v=2.4 cv=f+14wuyM c=1 sm=1 tr=0 ts=6a8180fe cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDA2OSBTYWx0ZWRfX8pC7eBxW2/Vy
 crLtcuzFyZpokNzMC9MXzDEl3RwTka+y2HKElHik9G5D6KEEiXqFqvNjKKwm1nc7nw3fbvEd5H2
 d5u4TKfShPKhLxCETjogD94fudNQFK567VBA5SPpCwlAWlW3gliqoMmf6PolVsvynYy3eMv1EbE
 OJVyZhNoXXwsJP3GHKHqbXt1QjdZ6yEMRfaxr7qySE9ldS4DUaM2dm/XN/MuBUjLSohjb30FJgB
 bs610ntRV3P5XQpb80P3pOKlNcGnN+nU8Vc1OeixqEhav/57H3tt+awnCWdAUm5mElBgoMYrLDJ
 sSkWPWxsNkSUHu0YTiqgNvSLSWgcK0vedDunMswkdukBH0qdag6QsdXgnVnEEw08G7E1GUGdKg7
 Iv7C8dg7rhWb1UcFGa3I72HmCCUuLKWHQvHGKvLA60bf8V/1zvzAY2z9lFsgJctgyUIjkJL/S0R
 Lw4iOlXIgOIB6k//9Bw==
X-Proofpoint-ORIG-GUID: TGGysmZxfz6ir3zv-0okI6lf-hJQUECb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160069
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 15/8/26 22:37, Richard Henderson wrote:
> Check for region disabled before checking the region range.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/tcg/pmp.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

