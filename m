Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4095CD98F2
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 11:02:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbytl-0006eT-UK; Tue, 23 Jun 2026 07:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wbytY-0006dS-SF
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 07:02:25 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wbytW-00066E-H2
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 07:02:20 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NAsDFp3578609
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 11:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=VTGkAAqPBzGluCPiab/B5v
 MxXekWkb9qKi/y3skYJ+E=; b=hfD5MwmRrq5FuO7EEDoa+gFf4MHU5e6FHygclk
 rIf4TqPN/taFTpGXW8H8i1/MQABYFm7A8XceCRuuVEACMFvxqhozyJDXAXOfBF0V
 prhxV948cmfRoGqfUas613wUDeQDaLjlsHELr6tmjrD0V8NegovO7EVZyvG6Iokq
 VAloAK29uPN3GKxc78LhE0y+E5Gk2wOwyat7Ob3AEXO80hK6tDb87TA+SiuWdHKG
 xyaPvA27IRFAOn825xuFZK4HKScKgvB9wiOqR8agy8kfmQyjpxvE3z/8ZW2XcyJf
 nghbi/vsKu/tvIBvyuusmVSeyqkzIWoYWAGX+xhDkEBkH0aQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppygn4c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 11:02:16 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-7e6b73b3920so6626560a34.0
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 04:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782212535; x=1782817335; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VTGkAAqPBzGluCPiab/B5vMxXekWkb9qKi/y3skYJ+E=;
 b=BUxpwoQnUJUzLke1Ob//3VlVC/MqVU/LJ5W2TCZRNzgFMR3YlGmznt1Kj04m8qysG7
 U2nDaszmgHJcUb2T/173CHK6JRduHsAZ795yoYiCQ2Hi1Emyn6SlcX3TE/dF7mrb5Oir
 zfvAGxR0GSYaF19oJQI16y4VEF1+VIO34DA7IJ0cdDH/8CJJGX5wEXASuA0AerYBig7S
 gOAFe8LFeOsL6OH5whDapC6ZCm+PiCOYCg2E7P04OA8dDPTqePmYnTuudZ1hxJ1jJmSq
 xcbsXvBJOaVWQPbBzSILWXsoXMaGvbsjYA2omojb3PbzR3qOkrBjpsJIbFV1I6tkHf5y
 RaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782212535; x=1782817335;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VTGkAAqPBzGluCPiab/B5vMxXekWkb9qKi/y3skYJ+E=;
 b=TrQkdYwu3EkAHk+tYGmnHLiMOhGL0j8II2cE+7usEcmngQCAu+26nerNa/zP+mDsV2
 PnVmmX2jtf4EOpdPLVSlxJgMQBGAsHpmORh0yboYLZ4qKeyn1bo2f9zEN4Fu6OKeSENR
 d/6hdUt5GQDYLiJYZcnvihhRTmRUIUB/2GN74k1aqQL4gu/tUXlG9fOXRP3A+Janfcxa
 pDf9kik18Pi4siWvy0QkDgOlsooNRj03FTpB55ApX2oBiy+be+obhftqko99xuoqZTp5
 EjcF1ERT0NwHKPT5NlFxdkC9JIBEySaB4mgVt0s9e9OP7PJWaln4teQFVlX0LUTiQIkz
 +gBA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+kmyhBOn0V3McXh3RblIs7AwvDksPtphjm3NJ5rI2VbnvxyeaEsFMjQ9fCvZncPo9a1IYcvMtToulL@nongnu.org
X-Gm-Message-State: AOJu0YyRCu5luCHhhMZMYJOBtzNEX6UUFPKYRoz6yCgIDgsSfusCR/Lr
 aTpD1D2ERxNFGPmZPLMw9FxGJ8sY1ulk5OJS8s0bX+DlVBvDbuA2LddJ7DAVPAvjIDNN8nScgKl
 AxsQbd4BczL8ZEtv6bYfaFybUjhU3MbyQsINRHjmXyh2B3WMNrTYMPNgElQ==
X-Gm-Gg: AfdE7clwrZmpZo8LpQuLA1EKCXzkFQYTLLtLU+EEO5m6aff4EaeYh2wGezdeC7Oc58r
 ZWI40jSoQS94wYUIpSvaiekXkK+a/1fFN7PZSgJu+GnwZ/w7vDT/MGu7xCUYN+scP5NFPtIonJy
 kcd8ApRkZyzWQC8ImcfvbGivu3Hvpur4L5d7Lich1RgdTkI/OadfnBPeuKjGDsPZAvgWPGHnocJ
 UL04MwJqkOdPqqtTsqZh2VyogBvcSfoB3QZel4kyR6qVyPt+hlrxQBtG8ZMwv6IPT6lfjLxZy1C
 A1pezrC4ELJFKJspZfH3hF3Ur2cDXBf9gTnHIQ6ZlAvrgdvZ8zv17unvN7eJPzfC7R41qms2jNE
 087B6QckYdwjOUrExbIYZO8LoETls0DlpFRdV3A==
X-Received: by 2002:a05:6830:6d05:b0:7dc:d587:af3 with SMTP id
 46e09a7af769-7e97998fc31mr1514670a34.23.1782212535483; 
 Tue, 23 Jun 2026 04:02:15 -0700 (PDT)
X-Received: by 2002:a05:6830:6d05:b0:7dc:d587:af3 with SMTP id
 46e09a7af769-7e97998fc31mr1514610a34.23.1782212535002; 
 Tue, 23 Jun 2026 04:02:15 -0700 (PDT)
Received: from localhost.localdomain ([88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466648c5ddbsm36315212f8f.12.2026.06.23.04.02.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 23 Jun 2026 04:02:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [RFC PATCH v2 0/4] target/tcg: Rename some helpers common to various
 targets
Date: Tue, 23 Jun 2026 13:02:04 +0200
Message-ID: <20260623110209.26861-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfXxAa15OCVLvm0
 0xkwjxo9jQ0JUprBtLE1YzNHlcJ2bipcSkR5chpIYvkSN/ePs1rhy1yPuwgI2mgAzxtWaLDkY17
 34xGTeMRPW0HpBy40A5caQLR9op0lF42VUqeHTPlpu/1VfyiwhHaiCNIN+mW1zzSUyPkQFGahXf
 TUL0UDxPvLY1F7qnNj0KM4FQqUgXUN9klIJG4tEMmJvw1tgLP5yy2VfP5wo0eRcT4BWz9dNe9Cd
 VHo+OBZiaqvhHuxmMKiU+9wweR95HtUenyQvLSwg1+qHh8jiIvYJi5wZ3Y0wzQhBDQS2JYOHCFA
 pNZJp8oC4jMV1TCVz0AE27LfLOzX9wGLn3TuEbFhLN75IKJpDGwWU145eoix9In63FtGafOB61q
 EFbteLjCRL/gyI26S45k0E32lGO+6GW7HLEg0vgq9ebYN782gII1JwRGA/s21otKNlV44QQultR
 Gz0MBSDqp7HITZX233w==
X-Proofpoint-GUID: fBU9iFUAmoH7I3XTnf8spWbam56nhCFp
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a67b8 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gCilnUSdiZWjTjviJ0MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX0TteF6O+Uuzv
 SJruNJeUGyth/cHoTwPh5awlYUYwvuHJ/MgSZ3yMgc8wsg1+GJ4jn/8o91qW85SLY8VpHBxXHQd
 JBlQHrAVKDNXVtZkFxhfZifp57SagEM=
X-Proofpoint-ORIG-GUID: fBU9iFUAmoH7I3XTnf8spWbam56nhCFp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230089
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

TCG helpers are declared using the DEF_HELPER*() macros
which imply global symbol scope. Unfortunately when building
a single binary (containing multiple TCG 'target' frontends)
these symbols clash.

This series takes the dumbest approach, renaming the symbols.

There are still around 20 symbol clashes (usually FPU helpers),
but this series is good for my proof-of-concept.

Since v1:
- rebased on b0df6e2f2c6c45df8d4d286933799c623e124d98
  (Merge tag 'pull-riscv-to-apply-20260616')

Philippe Mathieu-Daudé (4):
  target/tcg: Rename bitswap() helpers
  target/tcg: Rename crc32*() helpers
  target/tcg: Rename raise_exception() helpers
  target/tcg: Rename set_rounding_mode() helpers

 target/arm/tcg/helper-defs.h                     |  4 ++--
 target/hexagon/gen_tcg.h                         |  2 +-
 target/hexagon/helper.h                          |  2 +-
 target/i386/helper.h                             |  2 +-
 target/i386/ops_sse.h                            |  2 +-
 target/loongarch/tcg/helper.h                    |  8 ++++----
 target/m68k/helper.h                             |  2 +-
 target/microblaze/helper.h                       |  2 +-
 target/mips/helper.h                             |  6 +++---
 target/ppc/helper.h                              |  2 +-
 target/riscv/helper.h                            |  2 +-
 target/sparc/helper.h                            |  2 +-
 target/i386/tcg/ops_sse_header.h.inc             |  2 +-
 target/arm/tcg/arith_helper.c                    |  4 ++--
 target/arm/tcg/translate.c                       |  4 ++--
 target/hexagon/op_helper.c                       |  2 +-
 target/hexagon/translate.c                       |  2 +-
 target/i386/tcg/excp_helper.c                    |  2 +-
 target/i386/tcg/translate.c                      |  2 +-
 target/loongarch/tcg/fpu_helper.c                |  2 +-
 target/loongarch/tcg/op_helper.c                 |  6 +++---
 target/m68k/op_helper.c                          |  2 +-
 target/m68k/translate.c                          |  2 +-
 target/microblaze/op_helper.c                    |  2 +-
 target/microblaze/translate.c                    |  2 +-
 target/mips/tcg/op_helper.c                      |  6 +++---
 target/mips/tcg/translate.c                      |  6 +++---
 target/ppc/tcg-excp_helper.c                     |  2 +-
 target/ppc/translate.c                           |  6 +++---
 target/riscv/fpu_helper.c                        |  2 +-
 target/riscv/translate.c                         |  2 +-
 target/sparc/helper.c                            |  2 +-
 target/sparc/translate.c                         |  6 +++---
 target/i386/tcg/emit.c.inc                       |  2 +-
 target/loongarch/tcg/insn_trans/trans_bit.c.inc  |  4 ++--
 .../loongarch/tcg/insn_trans/trans_extra.c.inc   | 16 ++++++++--------
 target/loongarch/tcg/insn_trans/trans_fmov.c.inc |  2 +-
 37 files changed, 63 insertions(+), 63 deletions(-)

-- 
2.53.0


