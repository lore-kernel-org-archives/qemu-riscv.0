Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F02B606A31E
	for <qemu-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 17:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AkIh488I;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QAeyzpZ3
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWzRo-00046d-CE; Fri, 27 Nov 2026 12:09:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xWzRm-00045Q-3P
 for qemu-riscv@nongnu.org; Fri, 27 Nov 2026 12:09:18 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xWzRk-0007hv-8Q
 for qemu-riscv@nongnu.org; Fri, 27 Nov 2026 12:09:17 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ARFp2A82617456
 for <qemu-riscv@nongnu.org>; Fri, 27 Nov 2026 17:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XVq7DKqDfujwbtVULSJl38+IdjkvX1ex0l99cp5QMMc=; b=AkIh488IEphkR4NH
 E5dd5MoSY1LTINzRJdM+SMtfOs1GwaHuOUsvKD20YhutY12Kh8AViMznIECxWgf6
 Zs++6gZPpvdyeLpOLWoDp264uebr9ffbO3UgR0fnItM2PzULHzLvdUhPD87TPn7S
 XrDC7cEmqTDmUMsamqMiEhLJej+bRZXrbU0oZeDAcMhb2J+rHgUhFydt7SvD0M4R
 UcEOb2D5kltrI9Epq+b1s+F/yEq4noaXdIWsZk6L1gTSEgVeV1P2jGehBZlNpxxQ
 qDkWobndqTTi8YEkMwsE++hXP8osxQiWToBuuntzTYjhECyFgnZDILpQyDZeKVlQ
 40UMqQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hv06b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 27 Nov 2026 17:09:14 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-1b592e9841bso3461701c88.1
 for <qemu-riscv@nongnu.org>; Fri, 27 Nov 2026 09:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795799354; x=1796404154; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XVq7DKqDfujwbtVULSJl38+IdjkvX1ex0l99cp5QMMc=;
 b=QAeyzpZ3jPC4o08MhViaNn3dBBqDiPm9RrmHMGkGaVDI344DzsrCn5rDZM+pYPG0Tn
 f/2FW33oMkeYm2zai+9LPkbz5wrXqW6E3dp4yCxHW3WaJbgekXbOMzeF9Igl4o3MdzST
 dfbpUDHTgrAycHw6PIBDBAvL2K7I/EYc+cY0F/5rX3YqMFZjQwno8aTQadJJuJeE4n44
 u2745glWVhuBmkiYmuxW7POKvWIq9JL3ViKLHVfxyKJlWama/qQm9i398iBAS/WiJ3rD
 otrhcdR4BCaynTy/n2/UBNpo13sS2AaK91tVa6gZu6mjnPeesRT2l3PZH7oo8ya0EK9c
 lOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795799354; x=1796404154;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XVq7DKqDfujwbtVULSJl38+IdjkvX1ex0l99cp5QMMc=;
 b=xWkEeWMCsmGz9NVpE5OrknR2cHhKWbDGFIdBnyByCxwAuTkYMDZFAycANH6zpgXYzK
 +BxhwdbNH50Qp03Iwo/0touRE6/YtMZxLTzAcz5DK/C1pcsvF6OfLmRVvdeDBvOK2ifi
 9bF691rPi8zm5xAkPrsZlXyLQ0qkK9SL0WFyus8kA98pRacFL2MkHYL7nh/+dYXTSuv7
 kPp71K9Z1nDg8WlXHUfNYrN5S4nkUQaHhuN0KH+/TNTX/C0x9/OVF5Ucs6O5sUqJZH0V
 Xd6rjo3k226QQCRVaDM0WOapzNr4zQDdRVt6fzIdoPz/fFOiPlFqHe1jlLzlULr9TRI/
 JmfQ==
X-Forwarded-Encrypted: i=1;
 AL+hErG+tm5UmwqEen29eY50a+kbtnbIt4L3dgaGXPas9LbyM221+XInySQZYm0FBYsh8r+MCqNGCoU7r06Q@nongnu.org
X-Gm-Message-State: APuU4Z/1nq330UwMZPwW8Tflsi07Gl8E6I8P45jJeRCg4Z0F0V9xod0s
 PPRtt+M5/MmJVcQ5gOjs8vnw6aDCfxWkeamNLov/aBL3Qy5Bf6wTu8X0LE4vWRedMQK5wi3qS0I
 lPDrQS4ap3JMwOoichWY7Q9EfTdzMbqeDpTrwSbrVy2VmOMX+0uMNXdyR4Q==
X-Gm-Gg: AZFdTZe/65eDV125e95E3Ig8BrIXdukB9mZomlx+UXnYkPXCdGDle9IOuZVv7NUHkDJ
 KeKLwF+PJFoh5Kx5jWNaXkMxHeNENKWgwsCfpF2Ut46qH3xOpODDCcnb+CUCBqO1xuCgagUawxf
 DVGvK9Owe5tKLExqXskGTW3RqpiIab7IqTiYQI5KQY8tlCguuLyw6HswGM7KC3FlsfJ5ktMOMJd
 pkqLfS4HePVXVaLyHAFNz3EKQ8ZAx57YuyBzVp3n/Jv6lxH00TCBcdxK3b9viKt4zdTKytALjvf
 VnXN3KKRKYuawvNSvxepJ2+xud6wt44fN4ItKftBKG/3rTtlnWgWYApZGJSVDEhk5MumqVuOJ9w
 paLd0yjbXMr3yZp6E9hCW9slu4BA3Hl6DnzMeft2HS8yVn7ZBWk7D7Pa3SzkP+uj6sgnPSpYBtL
 YEB52pdJ2tk8A4E5p6+TbXhtPpwI9MsFgEzW1cehZRAYk=
X-Received: by 2002:a05:701a:cc88:10b0:1b2:60ab:1e9d with SMTP id
 a92af1059eb24-1b55690cf1bmr25405606c88.37.1795799354271; 
 Fri, 27 Nov 2026 09:09:14 -0800 (PST)
X-Received: by 2002:a05:701a:cc88:10b0:1b2:60ab:1e9d with SMTP id
 a92af1059eb24-1b55690cf1bmr25405589c88.37.1795799353728; 
 Fri, 27 Nov 2026 09:09:13 -0800 (PST)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b55ff0e4e6sm50800327c88.11.2026.11.27.09.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2026 09:09:13 -0800 (PST)
Message-ID: <0264bc38-9bca-4b61-ba06-be9988026ea8@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 09:09:12 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] accel/tcg: Factor icount_to_virtual_ns() out
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 TANG Tiancheng <lyndra@linux.alibaba.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20261126222530.62175-1-philmd@oss.qualcomm.com>
 <20261126222530.62175-3-philmd@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261126222530.62175-3-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2OCBTYWx0ZWRfX9iFX56S2dh+E
 lxWv06lU21OoP1chkH+EL01rlbArFV/mZTslG5tiqVal6/Rxl4hOzY2o0v0Pbln0QLiH+zGto2T
 SjEuWcsTECSluTIm9x84whIvdhclS0s=
X-Proofpoint-GUID: sonVGEcfj-mshVSXd377qR3Myfu2ZBG0
X-Proofpoint-ORIG-GUID: sonVGEcfj-mshVSXd377qR3Myfu2ZBG0
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b09b93a cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=NromAgFTz8thGiVjJsYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2OCBTYWx0ZWRfX9rBn7eQlLs/3
 U6OXeDlpnhUL69pWQhE7w8FL3/yA4dubIfpErRYS96Y/XOux2oos227BBXRGcvkgUYc2ulIOG54
 K1MZBIMO4GiVXJxDSiBOFKes42zv608caenCsvCKNVA1xbNCB5AV9uElsvLSHAkcw9jVQomP5ZY
 GBkg2GOyNrO8akR2dMBp2ne5gyIgXU0VTGtSAakdPsWKXQN2nQVoNiIr9F0KD7209pIKsqLMAwG
 Adz0CXhN9ndJjUc3yOGgnmgNlfhrjJ68YjFcW33gvj+SILFDFe0+qmUqy7eHdahjlhy3P8s2tPI
 eiPMn5rh3MM9yk2k6qh8n/A/xidNQLyqQRhx2qPqt9pq3XXnh7xD2Fxe/Qnf6hw+M0pwUHu08LD
 dMmy+eaDw7p51AQAW3+PerFQmsCIMoy7Ej3W2drN09112oh4R3D/5QbRV5AjfvU6VdVYk2Das6b
 7krhVZhksdAHWjD/0sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270068
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/26/2026 2:25 PM, Philippe Mathieu-Daudé wrote:
> Extract the QEMU_CLOCK_VIRTUAL computation from icount_get_locked(),
> to reuse it in a following commit.
> 
> No functional change.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>  accel/tcg/icount-common.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

