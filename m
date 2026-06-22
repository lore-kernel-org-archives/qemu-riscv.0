Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44BDCDB470
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 21:34:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbmHy-0002g7-2X; Mon, 22 Jun 2026 17:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wbmHw-0002fh-LQ
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 17:34:40 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wbmHu-0003qr-5S
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 17:34:40 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MJbC362122430
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 21:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NdegVV91+KIuv31DP7MMWE7NAc3cNONUByswJ//Kquk=; b=lgTXsRB2C5R2N3is
 8m0sduSvaqV2J65i6julv+ZVg3hdUsnkglz6E2l1iev+f0ljq1oJOlmPn0CDhF5t
 qO+anN05xucLHNXUNAJi7aVcHGtCqXA8BkkreFe7P6518doAfrPc2RasaLgBfUel
 9VEWhCFUAzMT8wM5pwL9Fzx8gF9ThAe+CUk1p0/P75aAIAy+x+vSeqrDXG8JILZR
 Ln/q4bJdP0CS5uEdU0yo1WRfqHCf6hkyLMjNR3Hy684RQjcMYgBvdOQuU/dKUiab
 sJignwfaNqrPwQwyu1eqkspu6LIVsLdwmYcSo2XeuNyDfSnnGJ9A1EGbZGE4hO/r
 oyU2xg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n41t20-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 21:34:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-30c011c7cb9so15050934eec.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 14:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782164075; x=1782768875; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NdegVV91+KIuv31DP7MMWE7NAc3cNONUByswJ//Kquk=;
 b=kYj/ySYz3YQz8mLWcEjRunNHa93u4wUds73b3aOLW19SmhCruyJ1FWfiNrpolF+J1+
 Xrkp8tKvwdS4e9+39pBt3f7lRaTcbhyyXRnZNkhvUuASkgQnzWK236dJ6bXiyCuX2IQw
 3sVhxLhC35k5JSfvmRU0cN9+QPB1gI+We0zIiw88Dj6CC+koE1KVof5e8LD11eWlPkuh
 v1gM4uo4R2uBND4rNyDDcc16w4IOcCNylPiulYTerSS90oFOtjX2ok4guYlDKhnlfWEb
 cBk66g1jSOLaV1bhfZSSzGxAt1d5jaO8qNZERg0EHdBsM+ZuZMPJMHU/g21Ogk1093bg
 LGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782164075; x=1782768875;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NdegVV91+KIuv31DP7MMWE7NAc3cNONUByswJ//Kquk=;
 b=pdMF6vnekul2Csj4iCltI7LhH2Rkad1elva7j5IV1Reg0MjYZsyn9OJfR39VaIL7v+
 36grp4AYkRv+430/uJ65DjE1uDkV6XCmMBZLZsU6R5xggyP5rXolVvqB/ugeU9JRR5IC
 BwlIZAgGSpAuWTA+jYDIp8fPL9sHsdejiiW/q0Fz5V7fpTZmAKz5xO/04hwuRW0acyrJ
 PBvxwDedd7J0W/+0dngJLceyyGXKumtlZTqUD62oXNboe0PwOuLfZmmFgjNQPlYtv5Gk
 RZlki65gzCyuFDRNYcNLp9tKWxuYusS3oLU7h9vMgbIf8k0vShlMfWjfkX/z2J3t5Bzt
 HVIg==
X-Gm-Message-State: AOJu0Yz8sx9DRSgk1SmK6SJRpOBXNtmd9TKnc41d7mwdR11f/T4BoWhv
 ypwyKL6CED+ALEPV9Wj3VHFDFUHZZBTCZoR//Q1QrQhcSea0JQ9FSzoZOo0I++R9RGJYb1zDsDZ
 1v1LGy2iQIPeVvhPUeUZ60cBmEQXuV+TAh4DtdkknwZSF7GoW8CbOHtcptA==
X-Gm-Gg: AfdE7clPhu+gHjhmACN6u/C7Rp1ymo9b5n2pHkgJiFJrIv9CWZ6bN6xAUqM11+3UDLv
 hehEUoPv4d7I1OmS8pDdRf+BNhdm46gRcxkKmk3Kl3eb/qrFhI+tgaTlSA3N/GSk4gziZFKX0lQ
 XSbPI79xKOVXLUROEGh/xOVJO7ZAqgjB7BofYDwOdfAy5GtlvJd6kws5X7uFN33tomOLxuWTl2g
 212yyWVUNyFTqxvzXYgD4HLFf+0m04nqJgS8YsdnuB1lrpkSm2RP7zFqXnU6uXQvTTy2NS04V5j
 uW8ismNdM4mpMIeyoYv3+IZhiYepCGXnJvUbkodGzUZQ1CMPKOFAcU+QyNaMsh3BKUBjJxuDISe
 xvwTNHUE7A0RZspEIHrSufx33wKQHMzgb5N6aTWde2AtvisVCIB+I6c7uJWwDNnO5DhF8iH0ofV
 1tNQE=
X-Received: by 2002:a05:7300:1904:b0:30c:52c5:6e52 with SMTP id
 5a478bee46e88-30c52c57c78mr1725359eec.22.1782164075535; 
 Mon, 22 Jun 2026 14:34:35 -0700 (PDT)
X-Received: by 2002:a05:7300:1904:b0:30c:52c5:6e52 with SMTP id
 5a478bee46e88-30c52c57c78mr1725326eec.22.1782164075061; 
 Mon, 22 Jun 2026 14:34:35 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c1bdffa83sm14732350eec.23.2026.06.22.14.34.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 14:34:34 -0700 (PDT)
Message-ID: <704cfba3-e92a-498d-928b-877f7f7641fe@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 14:34:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/24] target/riscv: move TCG files and fix --disable-tcg
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
 <52c3605c-345f-43d2-8cc6-794980c805fa@oss.qualcomm.com>
 <50ce1e98-2c1f-4cbd-b191-1eac324b71b6@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <50ce1e98-2c1f-4cbd-b191-1eac324b71b6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDIwOCBTYWx0ZWRfX5NRypLI53U19
 Agz6nwWz1EvujVMEk7kX7teaO2inWKuL/aLymiMI3IRThmSgpIezaQAy6hxldI5Ok8yHQtZ7mw5
 NKMJhD63msnH3EjKAaHHnkdOch0XM/E=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a39aa6c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=7FkO25ltchWHTzeOLesA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: dPksLVpyBcje3pVYb3t3n2CmItJuwKEK
X-Proofpoint-GUID: dPksLVpyBcje3pVYb3t3n2CmItJuwKEK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDIwOCBTYWx0ZWRfX0msxuyyJJLzW
 gtZfWuVvY5yiOloJL0V7G9G9oO4h+GGwsdNdDNg1b3KG8kBZ461bo8SVZt7PcoI8pzP0/AG4XYw
 DCxczgmUt1OuPlC3CddRAXFTfjwV7nXfPhaxvQqCwfkirLAzmhnwvlXh5u570JL9wBdAWCyhogK
 OqXkXkagzOoPtiWfNSTscYkWjCI/Rk35jTlspIbBpIjdkD4izmLLzHeYp1jm6Bbm+UfuzGYPVFn
 VZyDgQ65thC56mJlB2uLbSYWPopc9c2cvwCKBehGOV+bMX/ONifOhVz5+WXLthPv4ATXAz+hjEC
 xM20BfdVdzAXx8Xc3qeM+0EwqaOZB+6vUJiGk9kD5JPBGlUfLn3cKubgw1ou+32YcKSbOUfOMXu
 D25RFELLnEly+pMFO2AhmNNxPgJX6KTlOJ/gXUvcsHfVKzDlTn0SPmPCjvAAx6L58sP7hxGsL43
 51gUn2inQlmir+gAGuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220208
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 6/22/2026 2:23 PM, Philippe Mathieu-Daudé wrote:
> On 22/6/26 22:52, Pierrick Bouvier wrote:
>> On 6/22/2026 12:31 PM, Daniel Henrique Barboza wrote:
>>> Hello,
>>>
>>> This series looks scary but it's mostly trivial and mechanical work.
>>>
>>> It is yet another attempt at fixing --disable-tcg.  We have a recent
>>> work sent to the ML [1] and we had Phil's attempt back in 2023 [2].
>>> Phil's work didn't get merged and it's now too hard to rebase and
>>> revive, the most recent attempt got misled into the 'what is common code
>>> between TCG and KVM' dungeon.
> 
> 
>> It seems like series does not apply on top of master, would that be
>> possible to rebase it?
> 
> For some reason the RISC-V series are handled distinctly than the
> rest of QEMU, Alistair queues work on his repository and developers
> are custome to base their series on top of it (otherwise Alistair
> can not apply them on his tree and asks for reposts), see the
> riscv-to-apply.next branch on https://github.com/alistair23/qemu.

Unfortunately, it makes it hard to run any kind of automated testing,
especially for series like this that target specific configs.

