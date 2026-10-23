Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1DB606A31F
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 16:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h36sLCCg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CaF8G45w
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xKHpq-0000as-I2; Fri, 23 Oct 2026 12:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xKHpm-0000aE-Ao
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 12:09:35 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xKHpe-0001Tk-D3
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 12:09:28 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69NE5xcV2109275
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 16:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=PyWN7bLF2TyiAwLh470NhPLfJrR1BKCM+Lh
 39S5T91I=; b=h36sLCCg01TfkQ2Sw6wEAt1Do7TTgKt5Uc+vcaEMjoklj21Akv3
 fW9aeMy1xMoY9QugBBG6Loi5DbOPsM66eo/9Pbof+NfAA+4j7ZOBcLZZnenSC3ap
 ylUADRiD72yeCQ19X55RAN1cPhhhg4Uahe3yS0uoDcaRMSSRjeKvpzPhOaEqMbMG
 jfDLoPfxUFwOZlbXV/MivhzUqFJz/wsSuzOdVX76Id6IyY+GKkY1FsAOY3+93wqB
 1wPCdxMXgAH5Xq8dzgAnmXurpeizP41aJ/0/pffgrf12JW/zxAhJCc9BIcPMADUO
 /Ud2kXcNmDr9r1bK34TxyxX9Ydvm+xIiW2Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms4fg7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 16:09:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91b875639ceso22622496d6.1
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 09:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792771760; x=1793376560; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PyWN7bLF2TyiAwLh470NhPLfJrR1BKCM+Lh39S5T91I=;
 b=CaF8G45wVjuMrXcjySJAM4LtEfbZt7SjPqcENT0Q1t4RMo1QFIPfhqS37dQ0CVzfxf
 qEovzvmlxf+ZUNiCKMIfSjp72zuhpx+R7Blu++am9onAw242flfY++FhMxhX7tEUxMWz
 xvTJa+1Uv17RN0BJblglTnHp5OWUwwLi+xhLj23lU18a9+UxBy37KpTPPbyHllRq5UtV
 1txUQWZLMoWqS75h3Verd8AQ5/Esz2xgKjNUHhtrHys5nmzIcsZQ3DBhVyvbuFNiSJFD
 I2zz3432T4oOStBlCKWhQrkiMsR4rOCuMHirxlJCaLRmyqur/6r3coa+q5qL9mwwC9N/
 Vdvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792771760; x=1793376560;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PyWN7bLF2TyiAwLh470NhPLfJrR1BKCM+Lh39S5T91I=;
 b=DFzW0hXyA6dCKSZsDR3hWol9LaRxoYKo7PbR/FO6CwyhrdanRw9JkRrYPuS/Q5pD9b
 PKw/yddmkT8EOS560TNHjJlSzCCaGVAx2senmOPv88nIltrjp+UaFFeriGS1HEwar84I
 N0hed2PWjAhkAi/IS9dwDO89HEDfPmQiP+84CiT4Y+dRf9ytoU6jbuYT37XHnFtISxTC
 0vrTJsdTPuOpCcg92/XhFFmb/qCuUm7TDYD++tSmUSyy5rn6ivFhbtCGeKCMsBrqf9Lp
 IS/sSzGiRarDMSwVoTftRkHMQC99G3u8DPOVahxMJ+Co40JZ5y1gmUjZfcsvC+ws8hhO
 GdHg==
X-Gm-Message-State: AFq9FYKG8XE8DEPOt5XSFkq738pHJt3fNUNED66SEulVeO9G6+J6gWBe
 h2PMHcAHRdNjZh2GsSFrxFtQqfMEnuSqzCgETEX9iEqwAep1w3I1SmSbTKZ0nJAPpvFgidKkHFg
 qlCnpXo5VTL14RAvEvFYoIExNXQgm8vzZA0qxi7KDUaWis205imff4IQIEw==
X-Gm-Gg: AYBFou12+0LMhS52PX694nEUJPqBSo7GtNug0yCBuSNOBkQqk0kspHmEZf5GcORjHar
 hGQU8PJIqXGWI+x1i/ybk7fqTSY545ulWnwljSF18jjbu9r9YESOy6V6oDSWkriR7PD0o2ZvfJo
 IG4LrTu6ihbP5AE1VYwoj1aokY3BZK99VwNUjBFmuYcC0p/eH0THBg+jKwMzWAIrx7jeqVLjKc+
 CTntP49CpUZQjxPN3WMN0+w/qV6l6Xk6SqrpF2FzqAbSAMhwUoF2RNYo/8jYWa6UCnBxQ2P6vwp
 sw7g9v6oRd/Bb8udnxoI3l+oPl5f8Y8WBEgzjPev4BYBSUA/3VYTtq0PaA9dDzqxQyYTsaQGZNb
 lA7QNw88QRktqmOFjWy66QHZsdj3Y0QQcaWAzhw==
X-Received: by 2002:ad4:5aed:0:b0:91b:a0ab:824 with SMTP id
 6a1803df08f44-91c3acc68f8mr37254816d6.56.1792771759953; 
 Fri, 23 Oct 2026 09:09:19 -0700 (PDT)
X-Received: by 2002:ad4:5aed:0:b0:91b:a0ab:824 with SMTP id
 6a1803df08f44-91c3acc68f8mr37254056d6.56.1792771759368; 
 Fri, 23 Oct 2026 09:09:19 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([152.234.125.162])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c4524f226sm5063406d6.27.2026.10.23.09.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 09:09:18 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH 0/6] hw/riscv: riscv-server-ref refinements
Date: Fri, 23 Oct 2026 13:09:07 -0300
Message-ID: <20261023160913.24992-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MyBTYWx0ZWRfX1z+4OGJyPlTv
 X68VgZtAyyci2Xm2xlkYPWB/tu0CNwBDFItNdC9Nzz3VNj3uuEUCWGYWr52pYgN59LdLQhAKE1d
 xmSxXRpj5nM/HICDFgWoQ7UKlMta1+H2JDXCBEPD4aTfNoIMp45uvCkMr2Zxh8D/jOwo+TEOLzn
 fnSmTPRMclItB/IHVomE+t/5PsIuwNJT5hLBD+aFknDylSS/4EOw4fkh0M4pbkDNCHXDCRx1kBK
 X0zl4m94W3VnbgdkMTTij61GQ28RImQnpwIomePUMaLij06mOUpC07sioWwx5ueV8aAiSLD8Ywv
 1HikcKHfpiOdw+KA3/J8n2hh6fZfI18trcLmm/0CdulXo8N5dTsITQzWTX8fLdPm1ZsR4sVuR1v
 HCXwVltMG6+gskc0cnryRdkWNczm9Fxgplf/8XttNvVCMzrwfSaF3WXHvguWbmfSnyi+4SQHU1f
 Bwi+wiDn5V9tZumg9fA==
X-Proofpoint-GUID: 8MPeD9YGw0TcaO5pBSONNqVWXLkdO2pW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MyBTYWx0ZWRfXzYaA9ekK13z0
 08tUXh3lClFmvO6+ETnx9F/q4RegZ3lyDcjfC4Mm+M0x22xDak+aHOEmYCzE85U585OjD3fZqVF
 f0HB4fEgoisArXVPFqkVqKB30vbftUo=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb86b1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=AgQEunjic7gIBKSbIeB6Ag==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=dteICpJC5C4Zh8-mQl8A:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 8MPeD9YGw0TcaO5pBSONNqVWXLkdO2pW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230063
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

This is a small and trivial follow-up after the upstreaming of the base
model for the riscv-server-ref board.

Patch 5 contains a fix for the virt machine similar to what was done in
the riscv-server-ref machine in patch 4.  Note that there were no test
changes for the virt change, in contrast to the equivalent
riscv-server-ref patch, because there were no Linux/userspace visible
changes in the baud rate for the virt case.

Patches based on alistair/riscv-to-apply.next.

Daniel Henrique Barboza (6):
  hw/riscv: do not realize the device in riscv_create_iommu_sys()
  hw/riscv/server_platform_ref: set iommu hpm counters to 4
  hw/riscv: make UART FDT helper consider baud rate
  hw/riscv/server_platform_ref: fix UART baud rate
  hw/riscv/virt.c: fix base baud in serial_mm_init()
  MAINTAINERS: add contact for the RISC-V server-ref machine

 MAINTAINERS                                 |  8 +++++++
 hw/riscv/fdt-common.c                       | 19 +++++++++++++++--
 hw/riscv/riscv-iommu-sys.c                  |  3 +--
 hw/riscv/server_platform_ref.c              | 18 ++++++++++++----
 hw/riscv/virt.c                             | 23 ++++++++++++++-------
 include/hw/riscv/fdt-common.h               |  1 +
 include/hw/riscv/virt.h                     |  2 ++
 tests/functional/riscv64/test_server_ref.py |  3 +++
 8 files changed, 61 insertions(+), 16 deletions(-)

-- 
2.43.0


