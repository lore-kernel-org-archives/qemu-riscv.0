Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA41606D80C
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 12:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J5pUME3O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I2H4OStV
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOwyP-0003XD-4m; Thu, 05 Nov 2026 07:53:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwxm-0002vy-Ma
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 07:53:07 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwxl-0005kv-6o
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 07:53:06 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A59tPuY433302
 for <qemu-riscv@nongnu.org>; Thu, 5 Nov 2026 12:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8RQFiS3B/Xrb3cheKwttSffUdesHjxQtQjW4IYgw7+I=; b=J5pUME3O35817qWf
 66Yz02BkwUhXmNovnID82dCwrRNkZpK9RpjqQVFo+Vztx6bcBNH7vgTqr7ncXGvZ
 CJHPnMlVyTGfMs3KJNLzrZevS79G04O6LsujraIR70AfbHcbPFVA1692GEwEDHJb
 sJuOvYCz7LWQLzRzeogFSnaSjtodcy0sGPISqAFcjVpmpKPBiG+bDMybRksCYJU7
 L0RAm93iwwgs3fEC9dNbHvrNmbhlaKyHC1XDOH1SccHnhz4r5ErWMKhXWcL+coyX
 X+cRaI3D6jMm9cYHhVtTumVyrT/OXXTUSD4YpkT1F92WthL1zvQLCGcqYpZgsdtv
 7C6Nzg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcd9kbv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 12:53:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f1e62510cso452923185a.1
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 04:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793883184; x=1794487984; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=8RQFiS3B/Xrb3cheKwttSffUdesHjxQtQjW4IYgw7+I=;
 b=I2H4OStVczDcOj68i/zADNgdNwYU/fazNSBN4po9kKAEF/xf5Ob34zfW92j3FQUASZ
 EmEgWLRpF65Hh76E+BQ9EpJ4/ilrK41qv9C1/0tvzzecterXE2AkzkhtI1tJ33CTaugY
 TvATjvVSg2kaOJYV2/D2Wsb1Bf9hrKU19FvzXlaNcL/uDO9qBgGSaZMiAmr0c8XoyEkk
 iyY1CSPC2SneXHkL1tg1W8SEz6XQtQEKTTOY+y/8pdBAkt2HFm0n1cdACV0Ysmuf5wI4
 HsUh2k/KWM18o2GOTJyr0/8PJrdEUG4MmCu1osEF/pZX8vM5cxfZtecd1+TKEfzcVB3U
 NXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883184; x=1794487984;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8RQFiS3B/Xrb3cheKwttSffUdesHjxQtQjW4IYgw7+I=;
 b=Jkp6dCinTE9u+Fze1lI5U0R9YsY1TsGB5rMlPvmEKlMLAbeO1+4ySySxx8otq8979X
 8HkpTREvzRMfhBllStGK4ASkUZMEtMaD7v+7pb28HZL70XsFHLTFhYGb+WerKV1b3Ak7
 F9f8XLpfwlwp/44hejFKRUQuFkaMw9ELlvIWAzaMnEIHk3+sCi5ApUnna8Ooz5Hg705a
 +aZsS5yXMxnZosH5H3F1hVRmS6pkpr+neXTvgCtpga6UnIJUjnSzqTyPEZAhLXjqufTl
 xIIpqQO7JpNNaEs9G5yXuWhhxiEqMJvxqji8qGB8bA8GCFW011SkJjQtHT9Vw8pib2xl
 DDXQ==
X-Gm-Message-State: APuU4Z/4vOkO5qxIbgMmhUkvtBxUKNK929O8TGZgrEgq9fQwXjPi7Sbc
 CgBENp+57izweqggn8hHZkg71NbVsGd3lFeowirG7Noj6cLUWkE25MmU41EX+2eXOe13HOfsGtW
 3zszBaxT/KiHntCrKVQ+Jg+yC/02X0A8PeQGFTWnaUJhgJ+68wx4a72SgPg==
X-Gm-Gg: AYBFou3WBHy9WQnenGu7zPXKdXRSBuy9vmqi9V6n+2QAVTckQ7JOZXsUAdgfk3IgRQ7
 e7Ea9MBa9WWDFcYmeRfBkgDxTQHwe1/8BSLkxQRbkAtN3DgEZ9F3g/7n+MXAhNSJvEUhNjaVTGE
 oUBVGfzTsCJXk8rnbGChUS4FSj/jsB7IQRRg6YrNigBan/Ltx1wpuj1nKZwIs3mssrZBbKWRQYd
 rg80ZNSWnBKTqrmnxMZP5dgChImUyq1j36xGTcSxH+zpFfK14gtlQ4qQiNesAeJ+dvkzxkZxSWy
 OQgKu4skhCx2h9GffL6su0+oQM3tHFnS612OyebalKa3A5jx+/aWHI+x3cqwgLV7Z4DK4Br4GRW
 RsnebKP+1v9+aUx6ZLi6hk2NaWoAmdvnvI8hV9EL4R7yjNOxmu2tnNa+hszJmOZmbYaEeW1GueP
 fIZAbLFvWPyLKFV3xPHOrIN1jU7Kq2Rw==
X-Received: by 2002:a05:620a:a7dd:10b0:945:e74c:b1c5 with SMTP id
 af79cd13be357-945e74cbd3bmr107526085a.77.1793883183566; 
 Thu, 05 Nov 2026 04:53:03 -0800 (PST)
X-Received: by 2002:a05:620a:a7dd:10b0:945:e74c:b1c5 with SMTP id
 af79cd13be357-945e74cbd3bmr107524085a.77.1793883183080; 
 Thu, 05 Nov 2026 04:53:03 -0800 (PST)
Received: from localhost.localdomain (104.171.88.92.rev.sfr.net.
 [92.88.171.104]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b5719cd68dsm991650a12.37.2026.11.05.04.53.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 04:53:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PATCH v2 05/17] hw/ppc/vof: Replace deprecated sprintf() with
 snprintf()
Date: Thu,  5 Nov 2026 13:51:50 +0100
Message-ID: <20261105125203.40320-6-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105125203.40320-1-philmd@oss.qualcomm.com>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aec7c30 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=pBdeej1U2jlWEHTh2vTwjw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=IZgCprETnBKUNf_ylIwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: dzf6XmOJc6R5uqOcHtC-SpMNi-Cv8Ere
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX/h6B5G6/2fs2
 xtGXUWkYfhJAnKYdXnzI9I2/F4E2Ogy5y0FiTzKBcH3wxozQAgzVwpc00V3d8DrasvzJH4HGbb1
 L5OH0499qbKgtdVYsDBjRAH49fnCCUA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX0foIa+SgHFuB
 YrSDyfpDfjZueeIwiFQF/dD3eBOyuxWKHhTQL7vDhuOCROpuVfVPwl0ptkdFSKJR8OuHQMViCxg
 NFDVK54riA5J/Voa/bXqlYDej3TXzRwzESjucUqO/E8Nu/uhI5btSsFkxSEZ7mqrbWqGgmlopRE
 Wfc6m6Cfg4CgNEudao9RtjYJwYFlUnc0snYf6X+I1Sbt4DpH98iRL/oIHCrgMrrGmu90TMLbW/D
 4mghkmoocbzxbU80T2a0f4G73ve/vO3sDV9suxBYvCbIe3KwJ7BvXM6nN5x+e9M6+sR5GOY7ovF
 I6E3oTa56fYIOO/KpjpwY6zZnK/t//+kkW7EvgCLLSzb+77Dm4JpQy5+sf7lEbrnpWxI4uJHvIs
 aj9Gpiw1rhgocVlXHNg8YaOKsejqqULNzuLGEXzuV6TPZW6MKQFLjZcxYV4K3P145D+UonktNXs
 CbhUybASDZSoURmC3yg==
X-Proofpoint-ORIG-GUID: dzf6XmOJc6R5uqOcHtC-SpMNi-Cv8Ere
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050051
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace sprintf() by safer snprintf() to avoid when using
Apple clang 17.0.0 on macOS ARM64:

  ../hw/ppc/vof.c:104:14: warning: 'sprintf' is deprecated [-Wdeprecated-declarations]

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/ppc/vof.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
index 873e967f1e4d..ef89b71f7336 100644
--- a/hw/ppc/vof.c
+++ b/hw/ppc/vof.c
@@ -101,7 +101,7 @@ static void prop_format(char *tval, int tlen, const void *prop, int len)
             strcat(t, " ");
             ++t;
         }
-        t += sprintf(t, "%02X", *c & 0xFF);
+        t += snprintf(t, tval + tlen - t, "%02X", *c & 0xFF);
     }
 }
 
-- 
2.55.0


