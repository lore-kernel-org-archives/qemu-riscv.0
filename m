Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65DA606A330
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 18:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OUuvXSVN
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xT1q9-0004Pg-PY; Mon, 16 Nov 2026 13:54:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xT1q3-0004OT-SC
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2026 13:53:59 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xT1q2-0000GA-BE
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2026 13:53:59 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48b001cd92bso2550343f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 10:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794855236; x=1795460036; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=bsHRawm3s8PBxNWetjMw6HAVt2xlFOc5Sp4jfSBTOF0=;
 b=OUuvXSVN895dxXHjkWOYkKpAKuSVAJVkftW0N0wuj7bTAAaGIJHtGfOZrRndlqbTGi
 0QikRC6+72Aa0kt3sg5XZu3y1NHlab/uLzzXh4rrI9cN4QKN5IFJtaxnC2rjlrs9k4Zm
 XqDNS6Xr5f0GzkRLO/QTfNPdcslyjyKjkBGFNpP66ja4LbidmJ6C/kH9dc2hdVXXYhFd
 ck/eJawT92nnayeVq8YEcBigyPIPkgHlI9h7+ov4psOxvbuWrbiuUOEecO0Tr0XLNg+j
 3DmF2f0hzjR19KkcMaNyHGUuMMf0VUNfHmA5ZbbyyqGFKndhoWxrSMhlyxbNf9uNq3AW
 Ce6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794855236; x=1795460036;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=bsHRawm3s8PBxNWetjMw6HAVt2xlFOc5Sp4jfSBTOF0=;
 b=YGgGvy/cV/v0YnFl+lc4dnfx8+qVclDOPMCxuN/OxNdG9E2Gg8C1VQ3Umq3w4e89YP
 D8NclrihxnTCBcKYrZ1+UM6+MoKqXFT0d2M6IZn2+E+lrAdWXZ2EuPL4md+BrHduM+QP
 j+l1fdCPrK0ZherzyHpGSO1PjPBKJLFNmKmqAss7PKsSWq0pEMXK+ITVMdWb+t98O6l0
 JeXlUVSR7TYuvajtj2sfNRpzs5piaVpzRLLiwx5MBSOieF8ayHOxZs2B8/M9piE2n0v+
 nUlkK7pSomE7bDMBlyr9KV+zwP6X25EMfLkh+0z7vQkaRC8DJc2q+syudD9mvgQ4I4+7
 pXUA==
X-Forwarded-Encrypted: i=1;
 AL+hErHq6QSXPRauzuL3L3QmSP5wNEzcRVnrmsTz9ggMcv15hTpJj/voT8cfkGsnP+zyFwtg5EAUVqDLIow4@nongnu.org
X-Gm-Message-State: APuU4Z/4In6KdySzvsMYHUcb1slk0SkO888b5MIcOmAZx1/T4+qRi67h
 amxTZtYuLj712pJ/728kmrSG+4eQku6tvIukFM9x6+TbNq1M86ZzU++rXjoNZ/W4rvs=
X-Gm-Gg: AZFdTZeXOR/axN4qAcAfTYE9E8r1gXm3P8/b9gVdN6N+prIA+21c4rFcp/RAufEEhYR
 QpbQ1lqMD7XvcwF79V2+fXRMA4Bte5RoHHllMSVqsfHzdFhUAesgxLy2xENvcfoZ6rWHxUrQt6a
 YDXYxAawNPYZULgM5aA7nZpPT7jfagLYdVonMIBeDUsddz2QtsVpbJDCsAHFcU1QIaEj44HPge6
 a1PqYAf+F2M4i+wCmn5pefUrzbpUqnu6kQ+SHnPx1YXS0hi28lThRXJTnZBSj0IZlq+TZV2/HWg
 58THf585Xr/oN+OtVcQSj/hWJAxyPsOBH5cd6FazYIChvoswP4NLqeBlNcvA4MW1mauG4X9kvyD
 9PX8lrnARV13V6jP42X0P74F5n6a+meaXpp2LbGWyv/AeMgOKZjMUicNXGWQQpRRJou5zt3qMg0
 hA7Xk4y+tIE2WuXF2McVD966sZvnA2Ju6yJKgyGikYioyme/wPq3pQu56EwkFW1rHggLrm4HOYl
 DhjfnnFp4iveWyjWxXOXyKuacTJauWooi5kc50CST1CHmsehRM3i78gzEAY9C7siooKQwOCbEYk
 RBz/ITfdXC9TX47bdqgGmLBiihrT
X-Received: by 2002:a05:6000:4a03:b0:48e:f10:ceb8 with SMTP id
 ffacd0b85a97d-49c6fd932fcmr23863250f8f.11.1794855236034; 
 Mon, 16 Nov 2026 10:53:56 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e31sm20598177f8f.19.2026.11.16.10.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 10:53:55 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2AC005F8FE;
 Mon, 16 Nov 2026 18:53:53 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  qemu-arm@nongnu.org,
 palmer@dabbelt.com,  alistair.francis@wdc.com,  liwei1518@gmail.com,
 daniel.barboza@oss.qualcomm.com,  chao.liu@processmission.com,
 peter.maydell@linaro.org,  richard.henderson@linaro.org
Subject: Re: [PATCH 2/3] target/arm: Fix RCsc ordering of store-release
 instructions
In-Reply-To: <20260821064032.49556-3-zhiwei_liu@linux.alibaba.com> (LIU
 Zhiwei's message of "Fri, 21 Aug 2026 14:40:31 +0800")
References: <20260821064032.49556-1-zhiwei_liu@linux.alibaba.com>
 <20260821064032.49556-3-zhiwei_liu@linux.alibaba.com>
User-Agent: mu4e 1.14.5-pre1; emacs 30.1
Date: Mon, 16 Nov 2026 18:53:53 +0000
Message-ID: <875wxwk3pa.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

LIU Zhiwei <zhiwei_liu@linux.alibaba.com> writes:

> The Armv8 memory model has no RCpc store: every store-release in the
> architecture, including the AArch64 STLR and STLPUR and the A32/T32
> STL, STLB and STLH, carries RCsc semantics (Arm Architecture Reference
> Manual, DDI 0487, section B2.3.8 "Acquire and release semantics").
> The architecture therefore orders a Store-Release tagged RCsc before
> any subsequent Load-Acquire tagged RCsc of the same shareability
> domain, which is what forbids the [0,0] outcome of a Store Buffering
> litmus test that pairs "STLR X=3D1; LDAR Y" on one PE with
> "STLR Y=3D1; LDAR X" on another.
<snip>

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

