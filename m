Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B582CDB46F
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 21:23:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbm6s-0007Di-Ok; Mon, 22 Jun 2026 17:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wbm6p-0007B6-0h
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 17:23:11 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wbm6n-0007xK-Er
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 17:23:10 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MJcTtf1938648
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 21:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hHR9ZB7AZl9ok6pLMsVoA2GiSQtmbdk6v0i+v0f6i4U=; b=iUZPNpX3FeZ0UHqw
 FunLZ1t/B6xXX8Vgl+C+TICyyIRSTRBbFGKGP0fgvCm+5mWUZvK7zQzjwdCVkwun
 fHD1xcF0UF603Ft2WhYNJv1AYcj7uJyTw/JP5Pt9LYGaXxGN2OyrihAYlIRS5KTv
 4DPwMgVtxFoJkemasw/8bH7joTVI1LIvCSEXgyGDHIKINkyPQmdFjHPa0l4Gfwzo
 5KmP+iYLXX7cUnwRc5avthwj+X7ywhPoEkRmPu4GTQAF0uPFOMzpGD9k1c3BfOcS
 WaxPUbia6aHKfYPvM6I1xvMP/nmShLVgC2oUS3ZHjy2xDfzyHqJmFk62I7J6GUOt
 io9jVw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5ye9qd0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 21:23:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8cecf8bb835so82320646d6.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 14:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782163386; x=1782768186; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hHR9ZB7AZl9ok6pLMsVoA2GiSQtmbdk6v0i+v0f6i4U=;
 b=Z8llQQrUIWyLDoln+qfWIkP1vseiZKgXYZ2zr4ycJKRWK4LtA5hnZxLwXIjtXY7fkT
 /Sn963OIpErSE1A5MAfjpuPTkn3O5M4w2CPv4sQNZMFDYGoi408FeUeFwsUHGt1yV4Um
 s19Mjj5fOQdRyojN+CtHlVQc8nkGZkbPhxFDci8Agzvr7xd7ZkzZixPHDdFQ7EKZcDG9
 N4sH5L6LKiVEuGu4kemw0sEobuJ8t6KuGUUj/cbzifseSQQH9EJ3zGIs0vLW+9/vkWQ9
 STGpPeE2iY6f6BPCfo93Dh7geE+ARfEYNk3FwRbHBCR1qV/6ubj1P2wHCqjPsD4GFKgY
 OPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782163386; x=1782768186;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hHR9ZB7AZl9ok6pLMsVoA2GiSQtmbdk6v0i+v0f6i4U=;
 b=nytikdcjhvdqcFFMhu7s5HxJLFu0t2uBCKWBq+R88dry9w9nYvfybX+bafGRSiOELa
 SA8ief9OwfzGy3ictTlcvHUuU4V539sYiqAVZ9AtcEVdmHluO0YXJo4haTwiRHmOmX5G
 l7F4lbmb47Ffypa1LTGyf/1tQ4SuNvzLvH5tQegPI+/s1WwBH1mdzI4dUiiYHUrq92BL
 iOlQ2qx7yWmsCV5v6oVOn4DvzYx3nR51l7tKlyqSwMJEmqFSYh3957tS/wVdKcdx1jw+
 j/X4KYzWu3d+QXvAj9sJSvm0LM/nTfmHx5PEr4fvcbEZQFGk1vpJw1esMGMhHr99hUt/
 JEsg==
X-Gm-Message-State: AOJu0YwujGW55ibZ4ugxsYmk/E0aaOWbUkRdO0QLQYRbV9Bo1SNGBF07
 JsBSz8zVssJgMEbe5mcWeWi3heVRiL9wxbikP15pmtaLY0SU4q0Jejm5LDUxC6vfZOEwg11n2A3
 BWCp7NXmK/b1UilaNfwHdyeGr4MLJKUIrNo6VPfFKsSKxvRfIX+dzQPnYtQ==
X-Gm-Gg: AfdE7ckqEv9POgDGLWmfy+YTkC1gVsHrXfTNtcIbu0pmZCHnWf+14ZxTx16ClA7z3+H
 VLeXogsUdzZnZ3bks+2HlgIK0L6X9X6RxXxc0GgmbvnPGL9kUMHvpWGgHkI1qYe/rPFV2d/5bWz
 GkgqZVrkD7BHfqVVdJkBGXSbqU4keaK1kw48Tb85/5NhuJVQ4JjVVwANP9ajvwsXqPQc0iJ8AQy
 RQgEw6+BNNhtAL1DSXKEB/z9i2WbD0vmlnKIGQenDHyTXdsDlXOXPAImVn/e78AJFgHLRwyKFPu
 LF/TUDEZvhO7eY89eT0ixtYs41hNtFoNC65TY4lsm9NR9LcHlMlAXdAVvOYlvgr8A/kJv6R9HaX
 GrLwCYdDL5IWB3k/BR2v8LBK/yWrmrDmSQbYQjqnvQrphlmvijduNTjMpKhEwJQ==
X-Received: by 2002:a05:620a:628e:b0:90f:5da3:950e with SMTP id
 af79cd13be357-92644335417mr43843985a.9.1782163386423; 
 Mon, 22 Jun 2026 14:23:06 -0700 (PDT)
X-Received: by 2002:a05:620a:628e:b0:90f:5da3:950e with SMTP id
 af79cd13be357-92644335417mr43839785a.9.1782163386021; 
 Mon, 22 Jun 2026 14:23:06 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49240ee9bc2sm229929305e9.1.2026.06.22.14.23.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 14:23:05 -0700 (PDT)
Message-ID: <50ce1e98-2c1f-4cbd-b191-1eac324b71b6@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 23:23:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/24] target/riscv: move TCG files and fix --disable-tcg
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
 <52c3605c-345f-43d2-8cc6-794980c805fa@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <52c3605c-345f-43d2-8cc6-794980c805fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _BO108_2w_zcTZn8976wQNyOBvNqYYdw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDIwNiBTYWx0ZWRfXwcNRhCz9nDPp
 gdOCg719gq8MNOssyFGhSnQ+rZufL46uaMCVMuSfquIeKr0fH9jog4yJHRCeFKAL7814G/IqaRt
 RFw1ZxN5gc4maRa3nqtZXPkJMlWtQ+Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDIwNiBTYWx0ZWRfX0fwrDQPekoTd
 bqLWCi2U9YvrisndLFUWlr3VzQTCVovYAkp4Kk8QtgELdcVMSiY91PsI0hEFG43fPl93qM0Owuu
 EHbjEqoCHqGOgkohmAOmgCfZ29oQKbkpxb9AmVsHlkK8ZL9j+/huZHysL2cz5OqMtJuOCMGqb4x
 dxk0EXyCagDCMnzf6glU8qW2r8NV0OrXEH2W59KKI4kJ3O/0lOiHS25QBZiSdgNrguCV7lK1msE
 8mj/jYY6WtoDm8Bi6DWgElMP3xpj3GV1rJEHa55asjlvYsZWWnwmy+o23IV7Rc+B4EAx2rM7aOB
 pme0mgElY7qZypxq9mNqPiaQU8zVBpGowTxd2dCr+QsDixSJFysNoMgbfV8Gn/Lr4RknB+sEcEX
 7w0RDwVHWbPpJdoU8foqkuGJji8NQ6TeF/a0aK+/u69xARJnwGFKL+SOhiMAl7ix6IN2SgnB8sY
 6C/AujM9+oLg2jVX2Aw==
X-Proofpoint-GUID: _BO108_2w_zcTZn8976wQNyOBvNqYYdw
X-Authority-Analysis: v=2.4 cv=YpI/gYYX c=1 sm=1 tr=0 ts=6a39a7bb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=eW241_jYEfq5I0jrBXIA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220206
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

On 22/6/26 22:52, Pierrick Bouvier wrote:
> On 6/22/2026 12:31 PM, Daniel Henrique Barboza wrote:
>> Hello,
>>
>> This series looks scary but it's mostly trivial and mechanical work.
>>
>> It is yet another attempt at fixing --disable-tcg.  We have a recent
>> work sent to the ML [1] and we had Phil's attempt back in 2023 [2].
>> Phil's work didn't get merged and it's now too hard to rebase and
>> revive, the most recent attempt got misled into the 'what is common code
>> between TCG and KVM' dungeon.


> It seems like series does not apply on top of master, would that be
> possible to rebase it?

For some reason the RISC-V series are handled distinctly than the
rest of QEMU, Alistair queues work on his repository and developers
are custome to base their series on top of it (otherwise Alistair
can not apply them on his tree and asks for reposts), see the
riscv-to-apply.next branch on https://github.com/alistair23/qemu.

