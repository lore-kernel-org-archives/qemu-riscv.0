Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B87CA5FE2
	for <qemu-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 04:51:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xDafK-0005QY-Q1; Mon, 05 Oct 2026 00:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xDafI-0005Pt-SC
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2026 00:51:04 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xDafH-0007Rx-1V
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2026 00:51:04 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 695101np291143
 for <qemu-riscv@nongnu.org>; Mon, 5 Oct 2026 04:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +VaeglhoEdH3CTbUzxQX02IYWkLuk5sNuaNSGat4go0=; b=pxCO2EVYibuPa0+w
 fAT5ld9MKjFFNDzlj+LgXfNMnM2dQooYQTyRnZyXM1+M0TUWC0Hn8rEjod5nu2f5
 4Go8HqE6LtA1fYVczPJMe5wkgjB6SJbLtLQ7RWIke5VsM3cjY3V2KzWVc6VIojzW
 /ZuNi2dnCYLGTEGqmI37OUly93RPbxw4ii0C1R6nTcf+2c1hA82US25O8pJv86on
 9YxNjDfHeH9OJQDhgUFseUlNSgFH7F7io8IEAKb68l539ViUmCT+FlW66Maf1nZc
 x7ukc9DEtJj+Pm7y//FufoRFG0fRd142kI+KqdVWD2ikDBoa0VW38MOWAjaY6E83
 yDCtQQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xhs0q5a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 05 Oct 2026 04:50:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5350bf63ba3so39658811cf.3
 for <qemu-riscv@nongnu.org>; Sun, 04 Oct 2026 21:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791175855; x=1791780655; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+VaeglhoEdH3CTbUzxQX02IYWkLuk5sNuaNSGat4go0=;
 b=dpvf0jm0OCZW4+D8CuZdVxd/SHYRzsznc3fgmgdsNcB/9qSyFgLfNu25zndbNgtuXH
 bYVxh81Ft4ykND7b1dvZ106kZbmJHBwD8U1Hd7gIUtoHbF/aYfhzkHl9FhgLeq3gRE04
 iTdiuqUtJ1TQWCrTi1RhMnZG2lV6EYYvZgukVqpuJSOiXobaDt/sG+SU5L1k+QHIi2fU
 Zj/d5IT98oge3ZPcXHOD9MZn7lOaHMDDcCDRaiV+rLUVMFMixHyBKScJZXgg0P+PGKrV
 L44nv6w3Y6emp6T96SJrp/HZug7x4+47eA8ylfMXxsaYOt8M03STYIUspzdBv7aWzPaO
 Vzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791175855; x=1791780655;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+VaeglhoEdH3CTbUzxQX02IYWkLuk5sNuaNSGat4go0=;
 b=zRqpW0/aqOSWU80+h+5Vc39Qho8Kfj8slVl/YGC+R9qnz5fJKYkTo985vLmbKNo8D1
 HSJrdOsyXsNrrnqG6wh7ma52N92WtEPffViLzB74OYHg87OW+6/GmFx+hInM2NfHuMBr
 mIHd7nbu3vZXzVDQxK5Y7yAl7o4Vc6mZOf2p9Alww6JzrvWgUWSGoPyG1aHPbLmrz5bX
 02tNWTwwQRECiG632Q4bqCQdkM6HW7LvSYiuPmrRHYcRUG4AerPWMs/2ZYjx3ObxHt6A
 rcgNOrpiEA/M7rv+glvHnAyQQtmHUA+ojOz/iwrK/wGk3tHYg/sfEeDjO2UZpGeKNGJR
 83Sg==
X-Forwarded-Encrypted: i=1;
 AKwUvBw6iAXTTjMqjwNIIYrcHIZWWSCzRBJZPKQx1HWW9t9jTSuV/w1NvT3/W2yQkDNhL5KxdhSjufybjTIt@nongnu.org
X-Gm-Message-State: AFuF++kSKOFQTRwleO05RMJZLqpzwNQ6MYj/fJn9dMEYebxzsc+hbz0M
 kID+gCfUq+Y1AUnEKWBfNSjCFpBm6COpnjzC4z2ILaMFjVQE/rX7hIapiT3PVWb/AqK4Dam9p9S
 0tErW1qpKtu/CCaQZxhqyW+4YCksf2nxNJkTlytNK5O85iQ1WWKaY6/GYOA==
X-Gm-Gg: AYBFou3HvcPNphPNOpHMsVMS3vm4g5NhTVvZnvarUsihcIxCow9J6BjeDeRkrDgwiK/
 r3E2hbebXagrOEOKbixdi9xdEkS6r0HHkztCuWworAwwz5Tr4Bl5kq0pw4N/+TEf9uJF+Scr8ql
 cmZ/8o85opIN90h6DnDIcXGahu8pt3bIJtlsaFxmbF4uCfzqt/iXKDsS8ye6rKffcoaEju33zMe
 x6WuJFa2tdqM+lOJ6UIkOXEWXB5SR/7el7vooK5XCnp/adPwA3V1lDwXpcq0LeLnPW3ZR1f9pV6
 qzeSzCvoMZa2S9yhQolkN73LntiVpf/TsHMwrddDfZQkPBnw+o8VLROHSMSwR5bHXONC56kq0op
 5mGycrhrUDqoI6/k5ZxOzzKiHbC6OrVGBJlvE
X-Received: by 2002:ac8:5d04:0:b0:535:1393:a82e with SMTP id
 d75a77b69052e-5351393bdf6mr110269531cf.23.1791175854944; 
 Sun, 04 Oct 2026 21:50:54 -0700 (PDT)
X-Received: by 2002:ac8:5d04:0:b0:535:1393:a82e with SMTP id
 d75a77b69052e-5351393bdf6mr110269271cf.23.1791175854483; 
 Sun, 04 Oct 2026 21:50:54 -0700 (PDT)
Received: from [192.168.10.208] ([185.243.168.149])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-53398a5c406sm89174051cf.5.2026.10.04.21.50.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Oct 2026 21:50:53 -0700 (PDT)
Message-ID: <f57e0008-3773-4f48-8dfb-77c5ba33f26b@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 01:50:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] tests/qtest/bios-tables-test: Update riscv64 virt
 SPCR golden reference
To: Rick Richard <rick@sloservers.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>
References: <20261003161248.38903-1-rick@sloservers.com>
 <20261003161248.38903-4-rick@sloservers.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261003161248.38903-4-rick@sloservers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZFYa_mLGo1w1Hli8e2eQWgusYOazP9tc
X-Proofpoint-GUID: ZFYa_mLGo1w1Hli8e2eQWgusYOazP9tc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAxOSBTYWx0ZWRfX4o3jTY5brmK1
 InfA1zluV0q1ewY8pKvrvhTqx3UoFvTYjyoQ8r4KuDc6h+y0ai/D4hxMx9wN+mbMNIRa/rTGzkK
 4WkZnUI3A8ZcmWguBWjjaRV5cCIbw/Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAxOSBTYWx0ZWRfX5K92Yz4eApd+
 2YJnSnbim5OnbD5vOD+8XIfU98rWMUJTWjWQa8uEeChsrLKKFzO+F/XoCXebCjAmXjz8VCdnFVp
 Dj/AaAbtuDw2pyzs3oSNs9J0HqlhkvXlBADk2J0dzJoGXkMl5pLSnEkEvV7iT1xHlD5co2vq1WI
 mTaYz/Pd1071WJMigpJZxAqOi5uSb3kKq88dI80XB6wjuOHRloa4s2wBGTGyaFqKtyumnWLyY2m
 8cy3x2JMB/LEt7U4XUt7bCVjWxajDcmTN30M4MJdgcmpkRXtWpOciR18eQ5kiiRZcITiCknjdLX
 Pwo+VysXH8tofKOTQG9kYEkPtzNk3Gc0WNC5PEDLXOJUDGs9GKG2rKPHZbyVEN0LQPpqR0uSGIM
 NcLjWOnSs+uelUceouFpP4s8kxltDrNNJShOHWvokiJQKM4SrkxWOjiy+IiEQHGCVqmYlgqJ5Z9
 gVxizQhx1be+lav0GwA==
X-Authority-Analysis: v=2.4 cv=Q6tHcI2a c=1 sm=1 tr=0 ts=6ac32caf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Adc43iEMMYzOb2FTIT2GVQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=F-tV29oOAAAA:8 a=VDoLuduC8ymyZSW6m4cA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Y2dezMJzicAI2PZykhZh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050019
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 10/3/2026 1:12 PM, Rick Richard wrote:
> Update the riscv64 virt SPCR golden reference file to have the fix for
> the UART register width.
> 
> Diffs from iasl:
> 
> @@ -1,58 +1,58 @@
>   /*
>    * Intel ACPI Component Architecture
>    * AML/ASL+ Disassembler version 20230628 (64-bit version)
>    * Copyright (c) 2000 - 2023 Intel Corporation
>    *
> - * Disassembly of tests/data/acpi/riscv64/virt/SPCR, Sat Oct  3 08:44:51 2026
> + * Disassembly of /tmp/aml-10NUW3, Sat Oct  3 08:44:51 2026

We need to keep the existing relative file path here instead of the generated
tmp file.

With this change:

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>



>    *
>    * ACPI Data Table [SPCR]
>    *
>    * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
>    */
> 
>   [000h 0000 004h]                   Signature : "SPCR"    [Serial Port Console Redirection Table]
>   [004h 0004 004h]                Table Length : 0000005A
>   [008h 0008 001h]                    Revision : 04
> -[009h 0009 001h]                    Checksum : 13
> +[009h 0009 001h]                    Checksum : 2B
>   [00Ah 0010 006h]                      Oem ID : "BOCHS "
>   [010h 0016 008h]                Oem Table ID : "BXPC    "
>   [018h 0024 004h]                Oem Revision : 00000001
>   [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
>   [020h 0032 004h]       Asl Compiler Revision : 00000001
> 
>   [024h 0036 001h]              Interface Type : 12
>   [025h 0037 003h]                    Reserved : 000000
> 
>   [028h 0040 00Ch]        Serial Port Register : [Generic Address Structure]
>   [028h 0040 001h]                    Space ID : 00 [SystemMemory]
> -[029h 0041 001h]                   Bit Width : 20
> +[029h 0041 001h]                   Bit Width : 08
>   [02Ah 0042 001h]                  Bit Offset : 00
>   [02Bh 0043 001h]        Encoded Access Width : 01 [Byte Access:8]
>   [02Ch 0044 008h]                     Address : 0000000010000000
> 
>   [034h 0052 001h]              Interrupt Type : 10
>   [035h 0053 001h]         PCAT-compatible IRQ : 00
>   [036h 0054 004h]                   Interrupt : 0000000A
>   [03Ah 0058 001h]                   Baud Rate : 07
>   [03Bh 0059 001h]                      Parity : 00
>   [03Ch 0060 001h]                   Stop Bits : 01
>   [03Dh 0061 001h]                Flow Control : 00
>   [03Eh 0062 001h]               Terminal Type : 03
>   [04Ch 0076 001h]                    Reserved : 00
>   [040h 0064 002h]               PCI Device ID : FFFF
>   [042h 0066 002h]               PCI Vendor ID : FFFF
>   [044h 0068 001h]                     PCI Bus : 00
>   [045h 0069 001h]                  PCI Device : 00
>   [046h 0070 001h]                PCI Function : 00
>   [047h 0071 004h]                   PCI Flags : 00000000
>   [04Bh 0075 001h]                 PCI Segment : 00
>   [04Ch 0076 004h]                    Reserved : 00000000
> 
>   Raw Table Data: Length 90 (0x5A)
> 
> -    0000: 53 50 43 52 5A 00 00 00 04 13 42 4F 43 48 53 20  // SPCRZ.....BOCHS
> +    0000: 53 50 43 52 5A 00 00 00 04 2B 42 4F 43 48 53 20  // SPCRZ....+BOCHS
>       0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
> -    0020: 01 00 00 00 12 00 00 00 00 20 00 01 00 00 00 10  // ......... ......
> +    0020: 01 00 00 00 12 00 00 00 00 08 00 01 00 00 00 10  // ................
>       0030: 00 00 00 00 10 00 0A 00 00 00 07 00 01 00 03 00  // ................
>       0040: FF FF FF FF 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>       0050: 00 00 00 00 02 00 58 00 2E 00                    // ......X...
> 
> Signed-off-by: Rick Richard <rick@sloservers.com>
> ---
>   tests/data/acpi/riscv64/virt/SPCR           | Bin 90 -> 90 bytes
>   tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>   2 files changed, 1 deletion(-)
> 
> diff --git a/tests/data/acpi/riscv64/virt/SPCR b/tests/data/acpi/riscv64/virt/SPCR
> index 59d2c8f7f215a604612cbd0294c18bc6301e208a..6003c230b1a901e16dded8719e29dfd81055b474 100644
> GIT binary patch
> delta 21
> ccma!w;tCFM4vJ!6U|`Xn$R*FnF;U9^05RMIE&u=k
> 
> delta 21
> ccma!w;tCFM4vJ!6U|<oR$R*FHFj30@05N0)E&u=k
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index aae97304..dfb8523c 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,2 +1 @@
>   /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/riscv64/virt/SPCR",


