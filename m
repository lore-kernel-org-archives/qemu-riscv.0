Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646B9C43458
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 09:24:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wjZND-0000Fu-Qj; Tue, 14 Jul 2026 05:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjZND-0000Fb-2E
 for qemu-riscv@nongnu.org; Tue, 14 Jul 2026 05:24:19 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjZNA-0007gP-D1
 for qemu-riscv@nongnu.org; Tue, 14 Jul 2026 05:24:18 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66E7YG454101708
 for <qemu-riscv@nongnu.org>; Tue, 14 Jul 2026 09:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kwZLbG00s3qK2E9+IT/+QkPe1+PdqMPbGrfVl40b+xc=; b=QyL/do7+0j4VgGPO
 BaxmAgrnwz1q/89+81CH6fQi16aScSLg3AlY3MuUe8C5/OLUO1JVGP+lReF9yMdZ
 m7ihB/mB6cNd6gMtmGUdtG0FATHR9ShRC2IaqI99aNFUt9RAGWsvzG+HS1TrzygC
 /qHqx/rKxxgA8cM27aEEQNP26Umszhcvr7jV0iDXmZYOJFRukyVHnaPDuFoYKBY6
 YPr6DKh/GX4gnTotFROS/C290jxubk1cl8t09EjyhPkYUN0QkBTtC1muOcmXe6Qp
 d3Kk8lq9uBCj2rmelYX0htl+MqPzeCzTWkjBzpKhIUD4TJuFE5lccBrH3jDG0Cv9
 XQGYyQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgudgdf8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 14 Jul 2026 09:24:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5174a236220so64439081cf.3
 for <qemu-riscv@nongnu.org>; Tue, 14 Jul 2026 02:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784021054; x=1784625854; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kwZLbG00s3qK2E9+IT/+QkPe1+PdqMPbGrfVl40b+xc=;
 b=ZfL6DqM2d7YB6Wd6MJfjqQ8I7ztUm5DY+1IjyZGDp+xactvS0n2zLtLS0C/IsnW9/d
 M9afmEzx//bb3sErfdWnDEapP0+6/MZwy6d5GsnRM9WetgvMVA7OVrCVjqKv9WnI7LeW
 DUmonLiydT+hlO4TEiTK3v2Do1mMrDwTs3cF7++qKtnc5qnD24RdNHu0/lk5/DCLZITu
 avjrvopnWIGCZzUuVsEZSvevXDFPOsN/pci/YqRV4RKWQl+CVlAmQUPg62TKQqMmsJ+i
 W7ope44DJmV3bPdfP69NOXuSpRtBF674BPJregm++dfMa3hbBP925jT9pOTeX6+PA9oe
 gDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784021054; x=1784625854;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kwZLbG00s3qK2E9+IT/+QkPe1+PdqMPbGrfVl40b+xc=;
 b=cf74KD0DerX2KKmjHptJoiHrHWJq5Jj5OP2oVHlDpB9nBJYQROf56FIyujvw7QyvQs
 AXY2VXZTi/haIe8iQ8TCJombu3vcSm5Ug+fjxzMjz4tAvXdzGbs1oQ2CIKBh/0fanpA1
 vf/6t2ToCHr+6x3MKFG6U5720g+MXJo0GACA474GphYgQHcR8vMc244eAuWecDQ41w3J
 rizOfkIvB4pEtfA+4dtr8pIObzPFiTL9utiNVWUEF6Xp9NgULxdZSeUkFKCdL6c4GqRF
 wShTguqs+ZAX6ylLOE4B2eEh2QiryQKN+Q7JZOze+XQXjKoX2dMHx7JeIFCYVv6+Jorl
 Dpsw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpRM0b3MOP170epZZC90stdPg2kk7AzcI8bwp4K710MGwVaSyGa/Q0zHT5IT+NL3jMucKBM5nQQ+P0H@nongnu.org
X-Gm-Message-State: AOJu0YzvMO+9poT5H2ende3NVYXGeN3AonW4ghTuR+IvljF5E+gVVBop
 va7cUpVWRX/XCH01U5n+aaKc9TnSumNMKi6M6VYX/cZ8mVdiKfnZr2gjnd1+0t9+sBQTfeyEBA9
 AvCTWhGgFJUGTgdqXyvaYynPn36gSs8jiFAbqS7i8NOpmDXl4oBeuoMdvCg==
X-Gm-Gg: AfdE7ck08YfBrzv9n8spvrgGSZHHexP6D7JZMl/MGN6rya1msLJn654LtOk3dw791Qj
 EonPCYBKXGTdExHni/FyktMuJmjpx7OEMbWe6bzDxrxaqJOT0Q1rqvONIVdTyY4iMGHdn4c2US9
 cPBBeiaSB05wsoWd9+z8EagiIY1E7NU8RVQcNsbF9qg5kIz2kP2Hr3SITooujNbBkCGY7cH5oCZ
 GY4GJ67sH3fimEoewQqxxxG4+qjvtn0Cv4i1v7nThj9+ZFS6o4dg9lRYb2sRVV0lJDYXJ5ZGjEz
 K1l+q2ojqFivpImwG39IaVUUivEy/atu5g1ZDWKMFbE1OJOMWXYSfGv0iU1ZhB57Dg5xtKnrRDe
 RA2K6me1eqV2600rnVXr+Ygh2CMD0d41f9oOVLcXdlfQuBylLlegQoM5SB7zntA==
X-Received: by 2002:ac8:5fd0:0:b0:51c:7b13:62fd with SMTP id
 d75a77b69052e-51e3c39cf0dmr26799071cf.83.1784021054236; 
 Tue, 14 Jul 2026 02:24:14 -0700 (PDT)
X-Received: by 2002:ac8:5fd0:0:b0:51c:7b13:62fd with SMTP id
 d75a77b69052e-51e3c39cf0dmr26798921cf.83.1784021053787; 
 Tue, 14 Jul 2026 02:24:13 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c15dfda815dsm793849366b.36.2026.07.14.02.24.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2026 02:24:13 -0700 (PDT)
Message-ID: <c49d8ebe-d85d-4f43-a8ca-e006d4a411bf@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:24:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv/virt: Add optional UART1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Yanfeng Liu <yfliu2008@qq.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <tencent_06551FAEA44CD75E915AE611FCA0C99CDD09@qq.com>
 <24329582-f5cf-41de-aabe-c2c3d54f03ea@oss.qualcomm.com>
 <tencent_3045B23CF7A9872F29FC351E24D8F9373F07@qq.com>
 <6c0ff642-8125-4c35-8ed0-8f89da555ee9@oss.qualcomm.com>
 <CAFEAcA-AqgGDgRkkc4MzCcE1zeMT-aWbYoyPYsUJsYShy0-0dA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAFEAcA-AqgGDgRkkc4MzCcE1zeMT-aWbYoyPYsUJsYShy0-0dA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5GXCr9q2Mk_aknbUL-XWhEvhRwFtkEPF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA5NyBTYWx0ZWRfX4uLfdTfhbKWF
 aWabTTA2F/9v9SakZweL1BbP8h0I0k1UQb1KKOrYJPBaoKMBRp50Le0Q87s3T/bm+0Qvpoz7dpg
 CqnoGQXai4CGfu4vHg0x8OmtUVcpeLFyQ3Iv7iPc3luNLZIsaTKDDbxYbBxJcVHq+yOZZmWt3HG
 B7ezu1c1bKGb8wvKShU/duDerXo0QNHOEqG73SMY1ByGm1VX5Mai8D1uLXeEspO57663AUje3wV
 bLwK5Ii09bvFR57ewbFLZGTkLp93+3WvT7RAPj60qrumALEOwMAoXIBXBN34zbSZvbMMRF4Dwon
 UfWVLd9NXm3zR2Rhm9rGgCjeYdaJQUrDGPOUPQxj7rGQYn17ZmLJuV++uDd6DGVN4Ujn0uZMieQ
 9JdMc4/ETIebv3da0Rjp2q6AzwmTzGwHqG7gjbj5JhK5ZM9T5QgUoSJHmnONSDYNZkg4oBZ7yT4
 DcDUjnZhtL7LJ6cgwLw==
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a56003e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Ce5UDDiJR_swwK8C2rEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA5NyBTYWx0ZWRfX6fHm3CcMGFEf
 72UTOlaabDZxn0D2xwHloK3cR2/NCUHEtzugwi9s75FiRXjzQ+xAIDiN8s7O7hKbcJkvKtbVk+C
 KeeNTgdgjpX4Hd3IceqeQyzW54+KO0k=
X-Proofpoint-ORIG-GUID: 5GXCr9q2Mk_aknbUL-XWhEvhRwFtkEPF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140097
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 14/7/26 10:52, Peter Maydell wrote:
> On Sun, 5 Jul 2026 at 23:05, Philippe Mathieu-Daudé
> <philmd@oss.qualcomm.com> wrote:
>>
>> On 4/7/26 03:41, Yanfeng Liu wrote:
>>>
>>> Philippe,
>>>
>>> The v1 always creates UART1 carelessly, then Peter suggested following
>>> 5d8a250f9068 (openrisc) and e7100972f2 (arm) to reduce guest breakage.
>>
>> Oh I missed that. I'm confused because I thought not checking for
>> backend use of a chardev (in particular calling serial_hd) was part
>> of Peter's recommendations, since he did that cleanup years ago.
> 
> Where we're modelling a real piece of hardware that always has,
> say, two UARTs, we want to always create both UARTs (because they're
> always there in the real hardware, whether there's a serial cable
> plugged into them or not). Having the chardev code handle "backend
> is NULL" as equivalent to "this is the do-nothing backend" lets us
> avoid unnecessary conditionals in the board code.
> 
> For "virtual" board types where it's QEMU defining what they are,
> the situation is a little different. Ideally we'd do the simple
> thing, i.e. "just create all the devices", but where there's
> existing guest software that makes assumptions about how older
> versions of QEMU used to behave and the number of users of the
> board type is big enough that we care about not breaking that,
> we sometimes need to do something else. The "only create the
> second UART if the user puts another -serial option on the
> command line" was the best idea I could come up with for letting
> the user opt into the extra functionality if they needed it.
> 
> (If we have another future architecture that creates a "virt"
> board type we should make sure we have it create at least two
> UARTs right from the beginning, because we've now made this
> mistake twice :-))

Thanks for the clarification, I missed this is a built up
virt board where QEMU itself announces the hw available,
not some real world model.

Regards,

Phil.

