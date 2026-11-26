Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33272606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 22:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Volrc4rQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ht7N/UWN
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWhuR-0007le-HE; Thu, 26 Nov 2026 17:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWhuP-0007lE-DJ
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 17:25:41 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWhuM-0003nA-Bz
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 17:25:41 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJwpf71713034
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 22:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=8b4aMarPSfDb5Dz1pdkJ4t
 hsoe4UK1n/w1ltgqe+Vks=; b=Volrc4rQhn5QDpuYiHVCru8TFh5mQPirW9YR90
 lwv8ICsJ8Wb4LAGUxIxWYSWfuBzKpOsk4Pk0/RKewYeNHq+mUoDkxjrOVgVDYvTj
 hqil+ZWnA6VOSvJp81iuYgsJ79UZpW7aPOZCsaowB/jcmoUOL9ZJLOJp6eTc2WKG
 VokZmmrS2YFW3uAZGEBT7tZeWQPXCSN/ATL2s638aGiqzTlprYXyLHK//kRdL/sz
 niH66T7KW8e6vOfZGucnbIxKz2ky9A4DFGCOSgUWGkorUbAEEUHRXsEni54nhlAM
 rnHM+JNM+cTXiNOItOQqCECqqJPnx4PWvSoqVqyc7xN6yiSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne2quj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 22:25:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93e92aad34aso1263750485a.0
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 14:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795731935; x=1796336735; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=8b4aMarPSfDb5Dz1pdkJ4thsoe4UK1n/w1ltgqe+Vks=;
 b=Ht7N/UWNLl+Xjtd/F8ZQ0th3HT65m/DW263oqToEPO+oGjgI9cypkJjzAs4yJAiaBd
 oNJb6bHaJ17gFON4N4FtMAh1Jl7vzYVWrb8vuTcoTKxhQmZzutckiSYp22xGtI26rH1j
 rGUXKVYOrE9ZDs6erANA1vR8IVo9Y3OEs9gL0fGbstEjpLbj/HRss17YaqGjUD9YVBtd
 qGljp3LTEJ2dVx8Rnhz0JzA9WxDgUbYkiESpvY31V+lNbBiVsdKf2gTmHU/jjw9j/b/U
 KNk4NZu/cGCbYt3agaIoak1DiDddljefT1tcGVIlhbLVh5QqqeDJsD/55aqhc5/MPC0e
 5WkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795731935; x=1796336735;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=8b4aMarPSfDb5Dz1pdkJ4thsoe4UK1n/w1ltgqe+Vks=;
 b=H3p5HT6oCa9Ag7NN9eK2S4IejwpfnOFgP6XkIG2xEvvhbPoB+3UvRFv7vRpmZQ68cJ
 VLQcq/GmqEdCCjeovXgP3v+1Drn3LJLoO/KGtdt6d/T3Cnob5eTbLuGX7WL/BG2m9TXv
 S6alWckdKJc1IEU2IkldHPCbh3NC5yrMSFxrafKKxYy5gIZmDYOVMQ5PqBEX5mftymQO
 CSHzXifVnJFg6wHdaavpplu7l5MmNvTfBN7Vxuc31nbuK6O/tAyF2OiDLcUWGp+3eeOj
 NuAeQ4pCP8YxSjayqsDqCpyxj8+Ykad9bbNKTWxZWmpENJhzI6QJuIBt3yc8QMeoTUGk
 WDGA==
X-Forwarded-Encrypted: i=1;
 AL+hErF7NKFf3c9ZE8UKzA0x5WsyiBtdmuIeX2wiHN5LEIrKojjMKwKy+x5c9UMhI/ST8odlywb4QrkOTYhn@nongnu.org
X-Gm-Message-State: APuU4Z+3EAX5pC/lQbWLkahWPsAr6ENRJH3XCr6ROA83uU/cgKP3meYC
 7N71/cGJ8W32WvPq5F/3hTjDxq3V9vQjAq/+0CczTy/lBC2Lntv3ZbBOEOcdHkWsWuQyHrGlIW0
 /30lcr/TqH/d+gbdI6ADBY+f0+o/WXOP93qqg4CjMaydEpQiv7VoBM8dp3A==
X-Gm-Gg: AZFdTZcmZRdSqVMlofUcVT74BvE4Y77GIVhzyxQJF8sh1GiYlh9g5/OkIjZK2GxMr26
 o2Kp92diuWR4MjBn9te9GDtegV9sBnaHBEsxis23gweS88WMTC1Po8uG2YFvXSNejVYec5YxkPC
 9UW7N2fF7P5Yd1dAokgtaSVKi8cQtPFZbnL0cJd3PLDj0m1uj/1d4A4Ik5QwM5iw5N1iM1t37KZ
 ajYcacQiKLpmNXelRALxa0j2ZcNkr2TqkHBMbZAMHZdscs/dWyHgA6BnbL+E9ChSDk1maL1+Ai3
 bfV9y2jo8sR5N2b8UoW9ozBu3nwFyXfkyj5W2vqKQBwz/9pBvTSYgIJGF1FjFjrtEsCcoR0ihM3
 d+eib4OZtU3ifuHBxgij/zZZpVXxOocz6aJHwWSQ7+0LjkWNyqp2OgxcWZPBSRIR4BpUHgRc248
 f46W2NyKjn2IVpxw==
X-Received: by 2002:a05:620a:45a4:b0:947:1d0a:c89c with SMTP id
 af79cd13be357-949bab49f43mr3957948385a.56.1795731934615; 
 Thu, 26 Nov 2026 14:25:34 -0800 (PST)
X-Received: by 2002:a05:620a:45a4:b0:947:1d0a:c89c with SMTP id
 af79cd13be357-949bab49f43mr3957944585a.56.1795731934188; 
 Thu, 26 Nov 2026 14:25:34 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8960068fsm245699905e9.4.2026.11.26.14.25.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 14:25:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, TANG Tiancheng <lyndra@linux.alibaba.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 0/3] accel/tcg: Do not write qemu_icount from seqlock readers
Date: Thu, 26 Nov 2026 23:25:27 +0100
Message-ID: <20261126222530.62175-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b08b1df cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VKhtLThsFqOIEzYiiokA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA4OCBTYWx0ZWRfX1VqzVQFSEsEX
 cF7M66/afbdvuSR7KvmDFXE61G3LaJTo8UC0Hema6DARn7MuDusEuvvkHoZ8XY69JncHmPEiW/E
 FVyTbdUt/CO3iYheXLi69KzVO1/5XIBSTR+XQmqo3AQB4KKOuc7Q50nrG1H9YWKgy9VruF9NpYe
 t8pbzh22Yjys/v+iMP+FwRDaNCn9korx6Dkv+RXPI6uwLqrQH5a5vd7vFzVaE+MYXx9xdr5oxbc
 uLUof3g/Rdu4Ga+OhJ3EIGTxrMcLit/vGDz0ZtB3laaQM4El5I8rBwLru2+uUFftBVov1RLWzkb
 7n3UpGLyAOQGd367otNS5eVPwf+JEZF/6QTaOocOLrSJ4IdHfUw1PncZMhMApMZb4T1Fc2CA2NE
 RTFZSrG3rALXSxt+gVQ6miZQqEaNb2PRglGQcSrpdJK0cyZG3KoKIisa2+VnHaXdjvj7EGzJ6+P
 BlGOhk6rhq4dy5Tj5uQ==
X-Proofpoint-GUID: ke8FfePFLwAxULtPJeHRNwrNvfHmvfqY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA4OCBTYWx0ZWRfX59dWA8ordRfD
 ft25f44NNiTEFx0ulgFpt2Y0R1dIdQ3IV7WJ9ERpgOI59de/ujYitRNgRgTjWse+e8oiWZUJFJ1
 0L4HbfBxnSD64UV8XujvvF0pZ9PTvZM=
X-Proofpoint-ORIG-GUID: ke8FfePFLwAxULtPJeHRNwrNvfHmvfqY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260088
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

icount_get() and icount_get_raw() fold the running vCPU's
executed instructions into qemu_icount inside the seqlock
read section, without holding vm_clock_lock.

In adaptive icount (-icount shift=auto), icount_adjust()
reads qemu_icount twice under the write lock; a vCPU update
landing in between is lost from QEMU_CLOCK_VIRTUAL (up to
0xffff instructions).  Targets reading the clock from a
helper without the BQL can hit it, e.g. the RISC-V
cycle/instret CSRs.
(It is also a prerequisite for reading the Arm generic timer
counters without the BQL, which will follow as distinct series).

First refactor the helpers (patches 1 and 2) then performs the
update under the write lock before reading, so readers never
write (patch 3).

Reproduced on riscv64 'virt' by widening the window with an injected
delay: 7 hits in ~350 adjust windows before, none in 234 after.

Philippe Mathieu-Daudé (3):
  accel/tcg: Factor icount_running_cpu() out
  accel/tcg: Factor icount_to_virtual_ns() out
  accel/tcg: Do not write qemu_icount from seqlock readers

 accel/tcg/icount-common.c | 50 +++++++++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 10 deletions(-)

-- 
2.55.0


