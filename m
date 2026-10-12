Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E2DCA9ED0
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 09:32:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGCNv-00026Q-3O; Mon, 12 Oct 2026 05:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xGCNt-00025j-I8
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 05:31:53 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xGCNr-0006Oh-Qd
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 05:31:53 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69C8KndR1593601
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 09:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 d9kPjBTMGYmbCIRQNwoeHyOtgJ1qFU6TnXtSul0RM9s=; b=FJKLP51VaQ+JeTr7
 zrxx8uanhoV2cNeYdOhvzBe08H6yWrtSXhBxBD0YIXngie7euwBfcVNpDoRYfAAR
 YwqLNb/EVWNmbhRdRR5AKYChQj1g4wI1cYZOQ1kj7qtMXvvTixA0HbWa2zQqMADV
 +ZISW+AjyjUn0tAXlS45ZRfll9qE3hM19LxeGnxF24gwM5XZuRgORY+fVpe/OSnP
 C2RXF/lvx8jutqOkxejWvHCQOedrX2XFo47yNOtnXC2UGAuGF+kIS+RIZpFDBdce
 UkYS+Qn2eZlvcraWh1Crhlk9S4xhNVkTyuJNoS21J5RPVArRSj6GfVg32LSPUFEu
 eJU0dw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu118t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 09:31:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93e49a1d3b1so435376085a.2
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 02:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791797509; x=1792402309; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=d9kPjBTMGYmbCIRQNwoeHyOtgJ1qFU6TnXtSul0RM9s=;
 b=i8RKjvYl+u7tYLblQotTiqjYw5cb94qEAdeBiMczB6glA9pOO+/dpANh+BxcoRwASP
 J2pJgEROhPWTAz16kKuJ7WTmO81JVmXpFuHT05UiFzgKMUuFc4CpuvHHk9bh548KA79+
 XnZXbhqDBuwU/0m9u7wh3gAHhGMGPL2RB5nyhvynHpjoYy9D6PYeROtd7oFcFt8nIjRq
 Ppnd6ktGZwKjMDMB7xlRWq24zetajcX8Ie4rngoFRlh9CnOAYIbceIc/GsDBIsrlhKm9
 CrBZt3EVyPqChtJbrZvIhp8tnp7Bqfl/2c6na8StLPDSudwbqg1oMka1fTkhq92wrhDZ
 TepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791797509; x=1792402309;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=d9kPjBTMGYmbCIRQNwoeHyOtgJ1qFU6TnXtSul0RM9s=;
 b=P4GhhGubLRskhRqOvS4UgOBw2X7rG9RSyCmZyojAURcx+1ek6PlMkLDb1hA5jLEVVM
 Ntve6Spl/j+VDFjrVLPKTGyEduTpWSURVKFtoJSUNwW6hn/ExufM7mggnUiqdCfu0X3r
 YegN3u3WxG/CBEFq5pngxQU03GMI//Nx742fnj5EJTW0/+NAfkG5fZCmTcM5DExSWFvs
 3Mmg8BmkQ5OXqy/WIWfIx2sq3jcOmn1RhPFXCZQXF0tjUZ7hyua57m6YnX1yWCWdmL07
 BdnZhZ4HZNF4BSPfEi5o9JNEQfaHokM8mzsjkqmco7sl0xzx03pu3oDEK5LyWPojk1fY
 NPNQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx30xalKCNxpzc9i7WaA3EQacEmrN3grdGCtn/aLP8B8/oo/W9MKtjNAmnFFWSZ8XNhYsnxxMANkWOq@nongnu.org
X-Gm-Message-State: AFq9FYLlqcSNXi+G+DRg/tsKJnyTcR7wYgupSTiGJf3rWrH2yWb6mkQZ
 uxp/6R32e6CNKz0FLKO8f4CtOFkKnlVldcsUPLNhiGJEP465lX2oikr/7OE6FstF8Qtz84CNEzq
 iu5OMxsp6Nq0kfe81XxhwgbPoWQUdud227+MKIFMupmNjqC8Xc5o3BvogZw==
X-Gm-Gg: AYBFou3WBxUOY19lY9TDMGFvV5FIWSfOlA5x+AVpzQ4VWGiT/rFfailBIJ+oFCu0Dam
 pxvOvhvvEUkhWhFSrcTiOHAi6raH99O0dwuHSDL8sAkpNkir7zeV84+xWL3HeNQlRhckVPLlo8b
 oTYzyZlnolLAwgKN3/2l8RTLAnDO8H3WZMwxTnW/Ak2AiJtKf/1HVSzn5rIg4K9gaaC3SHiYLZG
 UVBTWpW2qB3Wen8DDbM1vmA0wVrG2TGn8VTDWnG4nSyl73hiMJXk/ZKBmGGxd8JY34C8/Gy1JC8
 uGyuQhCPVcMphZMLKSV9AKKJT9M/IOyLf7s/0NrTEw7RBrt9PFPu2GNM10rMAKgPfsyFV+X3GCf
 Wq3iaQwgvwS8CdtJB2xMU6c2jju3Gmu9CHAk=
X-Received: by 2002:a05:620a:2303:10b0:93e:c68b:5fd1 with SMTP id
 af79cd13be357-93ec68b5fe2mr847426285a.24.1791797509480; 
 Mon, 12 Oct 2026 02:31:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2303:10b0:93e:c68b:5fd1 with SMTP id
 af79cd13be357-93ec68b5fe2mr847424085a.24.1791797508982; 
 Mon, 12 Oct 2026 02:31:48 -0700 (PDT)
Received: from [192.168.68.107] ([152.234.126.58])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93eb98c7e8bsm815243285a.37.2026.10.12.02.31.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 02:31:48 -0700 (PDT)
Message-ID: <50b6effb-3245-47c4-b23f-370c34c165fd@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 06:31:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] tests/qtest/bios-tables-test: Update riscv64 virt
 PPTT golden reference
To: Sunil V L <sunilvl@oss.qualcomm.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, "Michael S . Tsirkin"
 <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Anup Patel <anup.patel@oss.qualcomm.com>, Drew Fustini <fustini@kernel.org>
References: <20261011182552.1071742-1-sunilvl@oss.qualcomm.com>
 <20261011182552.1071742-4-sunilvl@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261011182552.1071742-4-sunilvl@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6acca906 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=XIBTAJF/fpiF5bhQ2IRv1g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RvFTSsev-OqHwqxihHQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNyBTYWx0ZWRfX7kJAai4h48zF
 98AxSUF3QkM63p/rhCOBzE5tDU/aFXGuWAHgwi80Tu4MONTZOqbcJsxWpFTCNVGkKY5Noydl8iH
 DUULMAFI0pAwr4/lCCtFkXJcFkUaaxW1M8UEgMbrUnnQs6NPZyKBBvIJLvCLQP0CW2UAol/aRsn
 4tyC12/bvqvRUOxzzkX1ociLZqZBg7IIFldLRgzj95mdTfnVMGEZjgrcskXqBuhBKxrjP67Jtzr
 M2ZpPqAU7J9uknwx572tMZjSbMwcRGC1Oet9RuC7xFhryYL8VUXnBNtCy/i1+MLcC+ZcmfVmcBG
 i5NnKQvrJ81cGUfceeCpPIwAzIlottVm3t7aTTSzG2tl8fAs6Cezi66fCqRDpo4QLUvsCVvuuHY
 e/LtFcbhzxGUZJcM8UWS3d1JweXfDlooMSpCeWNo1XllsBmibS6J7TePmRS7CISTHKXTPu6JDDE
 ZrXafqwB3CwZn3jqHmg==
X-Proofpoint-ORIG-GUID: BJfbUsnWCsib88aN8n91gMEEhxR2kXuK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNyBTYWx0ZWRfX7gLoa5hgNYDt
 fRxili9/PHAbOs3mWJYIdN7MsbW97llUUzdt8uNUEZ/oldc04VB30kNG0NaRV/wDkdVcPzt3SXe
 TG73zmzcXE3JTMuMecLougD+/k1LRYI=
X-Proofpoint-GUID: BJfbUsnWCsib88aN8n91gMEEhxR2kXuK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120037
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 10/11/2026 3:25 PM, Sunil V L wrote:
> From: Sunil V L <sunilvl@oss.qualcomm.com>
> 
> Update the riscv64 virt SPCR golden reference file to have the fix for
> the UART register width.
> 
> Diffs from iasl:
> 
> +/*
> + * Intel ACPI Component Architecture
> + * AML/ASL+ Disassembler version 20230628 (64-bit version)
> + * Copyright (c) 2000 - 2023 Intel Corporation
> + *
> + * Disassembly of /tmp/aml-DN3NW3, Sun Oct 11 23:01:04 2026
> + *
> + * ACPI Data Table [PPTT]
> + *
> + * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
> + */
> +
> +[000h 0000 004h]                   Signature : "PPTT"    [Processor Properties Topology Table]
> +[004h 0004 004h]                Table Length : 00000060
> +[008h 0008 001h]                    Revision : 02
> +[009h 0009 001h]                    Checksum : 27
> +[00Ah 0010 006h]                      Oem ID : "BOCHS "
> +[010h 0016 008h]                Oem Table ID : "BXPC    "
> +[018h 0024 004h]                Oem Revision : 00000001
> +[01Ch 0028 004h]             Asl Compiler ID : "BXPC"
> +[020h 0032 004h]       Asl Compiler Revision : 00000001
> +
> +
> +[024h 0036 001h]               Subtable Type : 00 [Processor Hierarchy Node]
> +[025h 0037 001h]                      Length : 14
> +[026h 0038 002h]                    Reserved : 0000
> +[028h 0040 004h]       Flags (decoded below) : 00000011
> +                            Physical package : 1
> +                     ACPI Processor ID valid : 0
> +                       Processor is a thread : 0
> +                              Node is a leaf : 0
> +                    Identical Implementation : 1
> +[02Ch 0044 004h]                      Parent : 00000000
> +[030h 0048 004h]           ACPI Processor ID : 00000000
> +[034h 0052 004h]     Private Resource Number : 00000000
> +
> +[038h 0056 001h]               Subtable Type : 00 [Processor Hierarchy Node]
> +[039h 0057 001h]                      Length : 14
> +[03Ah 0058 002h]                    Reserved : 0000
> +[03Ch 0060 004h]       Flags (decoded below) : 00000011
> +                            Physical package : 1
> +                     ACPI Processor ID valid : 0
> +                       Processor is a thread : 0
> +                              Node is a leaf : 0
> +                    Identical Implementation : 1
> +[040h 0064 004h]                      Parent : 00000024
> +[044h 0068 004h]           ACPI Processor ID : 00000000
> +[048h 0072 004h]     Private Resource Number : 00000000
> +
> +[04Ch 0076 001h]               Subtable Type : 00 [Processor Hierarchy Node]
> +[04Dh 0077 001h]                      Length : 14
> +[04Eh 0078 002h]                    Reserved : 0000
> +[050h 0080 004h]       Flags (decoded below) : 0000000A
> +                            Physical package : 0
> +                     ACPI Processor ID valid : 1
> +                       Processor is a thread : 0
> +                              Node is a leaf : 1
> +                    Identical Implementation : 0
> +[054h 0084 004h]                      Parent : 00000038
> +[058h 0088 004h]           ACPI Processor ID : 00000000
> +[05Ch 0092 004h]     Private Resource Number : 00000000
> +
> +Raw Table Data: Length 96 (0x60)
> +
> +    0000: 50 50 54 54 60 00 00 00 02 27 42 4F 43 48 53 20  // PPTT`....'BOCHS
> +    0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
> +    0020: 01 00 00 00 00 14 00 00 11 00 00 00 00 00 00 00  // ................
> +    0030: 00 00 00 00 00 00 00 00 00 14 00 00 11 00 00 00  // ................
> +    0040: 24 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00  // $...............
> +    0050: 0A 00 00 00 38 00 00 00 00 00 00 00 00 00 00 00  // ....8...........
> 
> Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   tests/data/acpi/riscv64/virt/PPTT           | Bin 0 -> 96 bytes
>   tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>   2 files changed, 1 deletion(-)
> 
> diff --git a/tests/data/acpi/riscv64/virt/PPTT b/tests/data/acpi/riscv64/virt/PPTT
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..15598a9b8a3cc0cdd50bc1f77c73ae0ba728a272 100644
> GIT binary patch
> literal 96
> zcmWFt2nk7GU|?WUck*}k2v%^42yj*a0!E-1hz+6{L>L$ZK{PUeim9N9aRK=jNMZmJ
> Cwg&+K
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index 94be7a69a22e..dfb8523c8bf4 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,2 +1 @@
>   /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/riscv64/virt/PPTT",


