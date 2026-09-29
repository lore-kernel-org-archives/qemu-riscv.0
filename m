Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E730C9832A
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 05:26:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBQMJ-0004ZK-Q2; Tue, 29 Sep 2026 01:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBQMC-0004YD-Uk
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2026 01:26:25 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBQM9-0001bi-TN
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2026 01:26:24 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68T47Qbh2991001
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2026 05:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jpd8CBJugfETkbR85ahF7Wd1aLx5DAhy1NA0fIAAcBk=; b=g7H8i+HE1/gIMjnt
 9n8xuvpbpUwtSh27XrPTvN659ZsSrb9LKN2vOOTJR3CkxizUcrnDs/iMRyMmK6SQ
 qp4ND+CGmscV7T/tDd41lXoTAT7WLXM/u30aNraCgmAIyM3WME9evsDtaZqpec+O
 2DxaEPKs81xebpxZNsFRSPJfZvmtWP6AdcGKLxdOEVXbF0mQd5P2ZcOX0syWV98z
 niY4QdXommEl1Gzp9+qVxE7P48heH2Ol4Ux2FZERjsMqmz4ZcwKHAjZKeClRoJ/j
 u/8A71cTF4C9fUflVulcjUbwxqRvMWNqaNPzdM+ZMA1G/CjAU9QDsudn/VN6xDK3
 UinDYg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwna9yg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2026 05:26:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93909014c85so781855785a.0
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 22:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790659579; x=1791264379; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=jpd8CBJugfETkbR85ahF7Wd1aLx5DAhy1NA0fIAAcBk=;
 b=ken2vv3akGRYY1DGbzLwwhHC0GUlObpNyGim1rCbNL8Dz3G2l/JpCk62yHLcjoZOX7
 /EhAUqrniED5ShkmiCfEVyPVdAOlw51d8cmakc/bojUDW66TbeABfrgMAeZrl4UU+uCH
 1VlMZ2t0f6zlKDjHgQIsNmbsFRuGVfXoGz7wipzyR0T428v4MDLMFcgCy2k79deKxEgf
 7kZFdoAMzalzJKQM0R+cGuF3E7wCNdpF3YwSbRkbjCOCJuE4pQHDwv5EBplKwmqbcs6M
 oxG0WI1dHJIUN+TopVPORUAXjHOMFr3nuf7A9xACYb9Wgq7YTuflzXBjdR0QGbH7hzlh
 vg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790659579; x=1791264379;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jpd8CBJugfETkbR85ahF7Wd1aLx5DAhy1NA0fIAAcBk=;
 b=q90DYQsnpN/ectjFn4UBwj0MvxN9y9J3LdbipZNnHfYA2U6jyDguKgnH2tJqkQdJdD
 xlPoW3397N0rYeYZ4QDSXRkXBGoQhp5gzpUXZw5bHJjR/le4iwWVewG4T+zCU9oiozSs
 leD5JKCapB8JMIk2qytNGXZ1iMjRQtKeweyOxJTDm5Z9MWHs08kG0dbQWU3V/5K7i/e+
 FWcL7eQ9RxujJM+CsEdlYQAnfo9JnX4UpGjYjw8sbowL16Q/uX/qVRMLx32GIofCf1qe
 YnU2WtyhZYRbrTkh02kS7d3jzXzchuqxYrS/7YIjCPBhP8GG2R3Lrkb+1X0XqNylnie4
 aFGA==
X-Forwarded-Encrypted: i=1;
 AKwUvByiQzP6isIhm3jpqGJyCANo/AfjFyBZ46bVJ7+zsLzU7nXeej3VzatrSE7NHwyHpGKu9wCRkwV0KfDp@nongnu.org
X-Gm-Message-State: AFuF++lMs6zxq8nev7gU8No5dQaLZ9uhjCtcPFU9DBBD9d1cL10QNESO
 nTN4uSTq5h5kJ1Tba+I1nluULiHxI6IEUEAo1AQKc05AranJ1WM0iWzAHsoO8rhFe2rLy1pewYP
 1dOujjze7WnPTOeg/2neoGES9W1NPLi0MfLDkMtvEcOCsQY4dujr+KxkAUw==
X-Gm-Gg: AYBFou3uhSAQVEaFlXrBIQbkQ+YmgOQDp61wJ+RMvHiMbFNOZNJ+nUM9OhB4kbkHC1F
 dJFVUrbUyx3qI6SsDa4totI8/9CaX3wTJxgPiDP92i3/0votObBd8bwZAc1y+Z7uMWbgh/H5OnO
 wfIt2OZovTxGOeHo+UKzjQfhP/I7GGcXpzycOW3ZMwCW5OoANFa4rEq72tvwCPCt8xtK1F9mFn/
 VCIRY+5TmmuiNpo/DbDSG0bVovW37vGLJSsB1EA5oKQnTf2w9XIOI1On5d04PhZCn1B+e2f3NeZ
 aetCs2ysgvhoz5U3muwQwhtaoXeBmzjNESE7NaXwtdDZRMljLzW8+2uMHgUZq4MCpmmk3dlTY68
 i/bFFMDt9d2jjqbqD8zT5q4ClAdw+jrU6hA==
X-Received: by 2002:a05:620a:4623:b0:93c:29b3:3525 with SMTP id
 af79cd13be357-93c43ca0058mr2531050485a.36.1790659578820; 
 Mon, 28 Sep 2026 22:26:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:93c:29b3:3525 with SMTP id
 af79cd13be357-93c43ca0058mr2531048985a.36.1790659578421; 
 Mon, 28 Sep 2026 22:26:18 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00cfe16a2sm47919265e9.4.2026.09.28.22.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 22:26:17 -0700 (PDT)
Message-ID: <0c156b42-3476-4ac3-bd29-f4e878108f0c@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 07:26:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/24] target/rx: name guest trap numbers RX_EXCP_*
Content-Language: en-US
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Harsh Prateek Bora <harshpb@linux.ibm.com>, 
 Weiwei Li <liwei1518@gmail.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Chao Liu <chao.liu@processmission.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Alistair Francis <alistair.francis@wdc.com>,
 Stafford Horne <shorne@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eric Farman <farman@linux.ibm.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>,
 Glenn Miles <milesg@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Song Gao <17746591750@163.com>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org
References: <20260928052051.251-1-luoyonggang@gmail.com>
 <20260928052051.251-5-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260928052051.251-5-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nYfmAOX9nkFFcpj8gmomTAT1pxOmIpMR
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abb4bfb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=T3N3I3ExGkZWRGUW1XMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyMSBTYWx0ZWRfX+LmjmGu2hoY1
 ngAfDYqJhQ9nM5nAXARHusQ5RJk90+L+ipkwHSJDYFDne6dMoTVTKjukA3BGKaY885+TwEnaTpi
 65m6D7FnEQLloDUuV1TdBkIGYjLXnMI+lLHdnP6Z1SGDp9ADy9tvmFkSqqRkrw2zLRnUG2UWfLT
 ARtfSsBs6sznKuUhNRvXg30bL2BrnPR0UA7idtMCc1zefy4mDiKiP05PRYhqtPN924cZg5em0qp
 TUbGk4uZ5Nf5rQPURfM6RQWOgaoN2r0Q7ydthYuzrWMwz4OLwV1NtlmABaw/FHeie8ScnxHoYwT
 R3t6nbFzyMt8H34md//SQRj5D4kqPgQydueXOhdOC2rYzqE9Aa6q61buahTBrkkWeqxj9z49JT8
 pkU0qIVlNqraBzI3FPXo4M2wZFZzvNIqgKKusw8u2jcIhTolBMLnkD49gAVwcmfpGHlMHZ5zEpM
 lP0+EQSpn8p5qXTvP7Q==
X-Proofpoint-GUID: nYfmAOX9nkFFcpj8gmomTAT1pxOmIpMR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyMSBTYWx0ZWRfX5Ivn7fUS5vAT
 d2RPSp7IaohzZT+WmRnkBheu3sLpVlCXyBeESEOUrcclaO6Sd8m/aEMvIxiVmibX32ypfKjpP1V
 WYt4g7UUbqS2cQjOTB+/nGYSO7OtogM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290021
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

On 28/9/26 07:20, Yonggang Luo wrote:
> Add RX_EXCP_* in cpu.h for the guest trap numbers stored in
> cs->exception_index.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   target/rx/cpu.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/target/rx/cpu.h b/target/rx/cpu.h
> index 64ba48a7329..521e494172e 100644
> --- a/target/rx/cpu.h
> +++ b/target/rx/cpu.h
> @@ -71,6 +71,16 @@ enum {
>       NUM_REGS = 16,
>   };
>   
> +/* Guest trap numbers. */
> +enum {
> +    RX_EXCP_PRIVILEGE_VIOLATION = 20,
> +    RX_EXCP_ACCESS = 21,
> +    RX_EXCP_ILLEGAL_INSTRUCTION = 23,
> +    RX_EXCP_FPU = 25,
> +    RX_EXCP_NMI = 30,
> +    RX_EXCP_INT = 0x100,
> +};

Thanks for splitting in a previous patch, but we want to
add the definitions and replace the magic values at the
same time (i.e. the changes in rx_cpu_do_interrupt() in
the next patch go here), but also s/21/RX_EXCP_ACCESS/ in
update_fpsw, etc...).

