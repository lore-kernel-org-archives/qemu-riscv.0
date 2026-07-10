Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46994C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:53:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiJ8J-0007X8-F0; Fri, 10 Jul 2026 17:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ8H-0007UX-Os
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 17:51:41 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ8F-0005yv-9c
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 17:51:41 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK3f5r1753053
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 21:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8dxD6J5yAko3ZvjDWBXsFnyOA9q9eVwjuqPJaW0yfCA=; b=bdldFDm2OQhaTOA5
 olw0vS+9oafpGNXYm6crTN2rawua+bNBsRGDjHa8wdm3C0JFLlBRGrBitGgV1gpG
 Fcmj3+T2XNsgaYsWU0s/ErgktWA5piedGxrccV/bOyehcM0O8mb7+grXWdpIXyI6
 x1ihtBLQVgK0j2wjLoJTpKqaNdy/U+dbyZI7hFIdyiFtOF1M4gjqF7nd29/iaw+l
 QVQF+PgnWImJUY/iYHZWB3rcOdjnSaJ+iw4/j8fQcInK0merYLu3qpVuvMOdvvaV
 WIWfLR4WV1w6NZ3MkgVjM8YhBRGwqwNQxSFUpzXgaQx3aYZIYUGrjevWoggVaQir
 cqljjQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb2pc9h5m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 21:51:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c1e6f602cso24055171cf.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 14:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783720288; x=1784325088; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8dxD6J5yAko3ZvjDWBXsFnyOA9q9eVwjuqPJaW0yfCA=;
 b=eDijiQgIXbtlv8f9FxXU7LQDDDgPhesSzvzFFLTtcKWEiFOqng30hI1dv+F/3rynud
 x7VLXYS7jKSnN6oLKWo+s7/mLb6hXIg2wJeq6WNA48jXygc0EzwAkEl0BbYzBb+/McvG
 QJB17Anl+YmiyCFSgcJZXsVzrAcD0mJL0rX5LmF5G+dpLm1eQby+5cmIeH0IlJnEp4c7
 ADwNeAKJnqy9A48de4ghkeCSGrlUqlyJvEuCoZUqNWoMvVCEN0qdX0+XTJ+ZUzPxLzYg
 2022568HnsaoFJki/TbfK0NLn6jq+h26OiidCuBWDaT1Z4GIDWaPg/bXimO51wZWtb14
 WfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783720288; x=1784325088;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8dxD6J5yAko3ZvjDWBXsFnyOA9q9eVwjuqPJaW0yfCA=;
 b=khQUNC8xC241x93BSL3IFohGHG7fTCSHF0JjAgtNOgJiqQ8qzHMjuB3vo9FgSjR++P
 tztaxTtyEJNeaD1zzVLuPYvFuBklrUh/HSuQSFwiQZJ2uztYwN0oZVNQGovuQac+uKuC
 AkABuRzteA744VhwgUqNLM8IZGx+FrrDvPtR3fwd31ufC4bWKeOXsGfdMpMCM94OMEJ8
 gwD/iQ6bvhapF9m5/jUY7cuks9ivzEpIV/2Vlzts34Uz1Fe5eVTRU1bF46Jgph9tj49W
 1hAyIIDF52tRMpDJLXixSKXJjwAOogUF716Y8YQIEd1d+MuA/EbPwZ7HzYbouTKxCkR3
 H1Yg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqPkJGkRmaTcEH9RstayIRa+AylMyc8z1sOzW8aOr9+PwBSORDiCzeqYHHBG/mZMxGqq2nquGoWCrgG@nongnu.org
X-Gm-Message-State: AOJu0Yw6aIiBUTOwM5SIwWNDZJiIEvtITaU4r2qqH1ZDJqR8gNJWT8MC
 NupOgX2OHncPi9GCcxd8fOZwyIbxQajdhzY3g20yWgIeUdgZsNqS8Xab7xxcDDl/0GkZ8e53tzP
 3YQ2N4nK0QsoESYNhZz+JRUmeBn53arJdXkJA5KT/fvp36SrL4fdi1sGVpQ==
X-Gm-Gg: AfdE7cmQ47KO8LTxJ172UdU18gu6/xlsxF5Q4I3OREmhMngEf9iFSf6BAEE09YigiEw
 MGvNVnp5nmMPD+gqNVtFjfmB7BYuyYCo7AaaSyNpo2U/P/Ea2Rgf3+nRHm3YEAljd17b6B5T1GD
 ItbkjKHxYYhxw+22oneDCZ6YXxExjsVuc/q9lgbPjy8gPq3KNVUy+6tR0C4spQ1SX8Mpq+fTQ5v
 tXk+L4nqw/jn53OnPVC5epa+DbWPBkPJnO7uc3pJ5yaXyAbf8mdXTlLGAfoL8qKyo8Lratoq0zP
 eV6O+Sv5q1+bvB2eK7STFw+lMe2YKK0PkgxXJncwO7DaBwqKaojAfT79kdbNV1Q8/nv4PVPvSW6
 UnyyQOZTd2FwOMRFPG4j8OihilUS/9b985at2GVv8cvjUGIic5/vO1fz+lRHZUQ==
X-Received: by 2002:ac8:5808:0:b0:51c:7b12:120d with SMTP id
 d75a77b69052e-51cbf3402b7mr7598231cf.75.1783720287682; 
 Fri, 10 Jul 2026 14:51:27 -0700 (PDT)
X-Received: by 2002:ac8:5808:0:b0:51c:7b12:120d with SMTP id
 d75a77b69052e-51cbf3402b7mr7597991cf.75.1783720287271; 
 Fri, 10 Jul 2026 14:51:27 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6df6d9sm181387215e9.7.2026.07.10.14.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 14:51:26 -0700 (PDT)
Message-ID: <02dbbb88-2b9e-4604-a36c-14bcb00e8746@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:51:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/51] target/arm: Make check_watchpoint_in_range static
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxOSBTYWx0ZWRfX15P6/8KKiIET
 9XqkVBOh1AQGFpnPAIb0S+ULZaPR1IYutaUdhHB1/3uZnhXl/sSoLEGG5RpcsfM00cRwH+XWmeC
 xfypp9ib53swNt19tpTrDba05Yo8QFMNHZ69FaDTg7EF4Y5N32o2RStYgS7yC0rRxNp+KBi65eC
 Y/WtOTxRXSyJppl+I1cFmBbIa8K8rKumdcfU2TvB2r4IBZ0b3Rk7PxdbgcSJ32+5tdYSgkKFGN7
 CQ8sG1QTOHqE2YWR4oNNHvbdRfFoAZlseUaxCADljjyixVhFblURFcqnRXe7HSsRRnDinfP1lWG
 +8l+MRlSz9fKo/bAZX+DeBJc5ihcsgtnON6nNCEfsMRKn4ua05bxO1Qt2mnIayiYa6aw5RNqJbs
 leXIuqvCMOR7LeuweN1P1TmF+JFw5WLB9QG4B4n/ik84/i3hTfPGL25uokUCjcFOlqof22eECE0
 ZLb64+pqA8SSIOlM6iQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxOSBTYWx0ZWRfX4KxKKeGktvXr
 wcAlnSb/Rl0P73nNKRP9mMNvefJJpY+dQkZALAsllS7Tlf14Enksdf7m1Bc3LYqyRtFGP3nCwAq
 UulMYIQRzUl0Lbv1v36RSZzMrT6u9bQ=
X-Proofpoint-ORIG-GUID: oiGORAXkNYE64ToHryV9bQZE_cL5Sc5X
X-Authority-Analysis: v=2.4 cv=J9SaKgnS c=1 sm=1 tr=0 ts=6a516960 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lg_xICGfZuE_qk3iapQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: oiGORAXkNYE64ToHryV9bQZE_cL5Sc5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100219
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

On 10/7/26 22:53, Richard Henderson wrote:
> This function is not used outside hyp_gdbstub.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h   | 1 -
>   target/arm/hyp_gdbstub.c | 2 +-
>   2 files changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

