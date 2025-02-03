Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72304C02192
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 14:16:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1texF2-00025V-31; Mon, 03 Feb 2025 09:16:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texEp-0001fa-PN
 for qemu-riscv@nongnu.org; Mon, 03 Feb 2025 09:15:53 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texEl-0008Fd-Hz
 for qemu-riscv@nongnu.org; Mon, 03 Feb 2025 09:15:45 -0500
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so746207366b.1
 for <qemu-riscv@nongnu.org>; Mon, 03 Feb 2025 06:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738592141; x=1739196941; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a8DLNiMTlVpLcrkpzTxDv6WaCMVzL1II9OOeA1yxymo=;
 b=GhIXINK7AYqs5NryWWW/4s0crR0YI3/G5lL9rqk1K/G/KAy3LMbXZRP8eI5IvRtw9N
 GWxvMknkR9fodsl0P4jf2F1uj7NnNhoJ48RRbcpgIqWPadI737sRbsXydVlzY2hTmxTS
 vvNjJB1fSgR80nIYqmzPqiOxyU9XUFxYY8vZv4QIf6H+eDs0TLvdHQyd75MuNYrL6sxg
 plCd4fNxk6s+svCcuaHkdK58LH9vbQ4e2NJO3rWTVT6pm2RRxB15c4HODNPoCa8XgygO
 1Seo45NqPBczAf8J4YJ2PxdpiSgakz/JfoE4DOHeUstrx/Kv/0vqNX2OeNZGnfBTBWJY
 Uvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738592141; x=1739196941;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a8DLNiMTlVpLcrkpzTxDv6WaCMVzL1II9OOeA1yxymo=;
 b=ksNuex7i8ZFx0twkUDuUsHa3qlodXyvo7VHNk2AZqxH377bgBhxb38rzh5GFGZidU0
 hTkD/4Ktor0FMpFCVUz8NvWf3AbOTQ91s0i7R8ijTM9QXDttpkCTc05U4yzCMXuKKvyC
 55K5WqVfya9nhuaI1DW3Nf94GBVUDQ+yZo51Smv7WYhZ62h6RBoQGqGBc+1RlpPPvsdT
 nFNx0Ckta/BFA5yHNzyHY1tHgpvcb8B1FLIDDN8g1f9x8G8S4E2bQPW6Jvo3ei4Vt4fh
 3Q90jQN4C4WgcnfYawTS6bOZ1KF9tsl0cwi9CEpV0SRxXcR2bvMu7W7NIdDDEBP2rkqw
 JW+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyVMBMUKhcqlvm9PkcjeeJmoldmMEu6Tkyn1xNRsgnL9PTT/QRuhVowl8jyIEl4qGoz5kt9LfoKH6R@nongnu.org
X-Gm-Message-State: AOJu0Yy3ee+O50rKdPszim1hMwUkIFm/LVqQQvUwh2lyM5GWCqURMt9I
 BsHtcU9UMvWsbDtDtjwMgjo64w4dx6V0foxmiooZh/TnjpUiYfCwV2EH+N4TWX4=
X-Gm-Gg: ASbGncvMSFiUxg/o/j+pLafAdU0cjrVL7ql9PYKDLSXLYZ7jHycriNVOXV3L90bRHiP
 NaEAJ5dG+lFJduvG9MsikQrItk8Uey3jJB48D33PqI3OEdfNtLSsJ7HSqjI8Ad3VSYl6LfbJ9Yj
 f5YBQnMYJDhWaWw9sbzjwu3iohD139xwyiVr9pJdq6CT+Od5d6AbDFEftmsJlrHEgfHteyoAcs5
 NoroLfyAolVYpIBD7FjBKMxAdkm1k0eBKxDunAPIx2D+5BSuqAJ6JZQBs/Zz8/Hk/pSgtzEGd7h
 bVEzwDM+K2YkVo9Lgw==
X-Google-Smtp-Source: AGHT+IEPL0/gAu4hoPsJMqL9NcTFl429Dwefiur/dR8AxW511cwk+fV3AItGSf977GcL8DCPpOJmqw==
X-Received: by 2002:a17:907:72c4:b0:aa6:5eae:7ed6 with SMTP id
 a640c23a62f3a-ab6cfce8dbbmr2225358066b.13.1738592141399; 
 Mon, 03 Feb 2025 06:15:41 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a2fa09sm765980266b.140.2025.02.03.06.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 06:15:40 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0198D5F8BF;
 Mon,  3 Feb 2025 14:15:40 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Julia <midnight@trainwit.ch>
Cc: "Daniel Henrique Barboza" <dbarboza@ventanamicro.com>,
 qemu-devel@nongnu.org,  qemu-riscv@nongnu.org
Subject: Re: [PATCH 1/1] target/riscv: log guest errors when reserved bits
 are set in PTEs
In-Reply-To: <8149beba-66b1-4707-93f1-083b8bc5ece0@app.fastmail.com> (Julia's
 message of "Mon, 03 Feb 2025 18:12:21 +1100")
References: <20250202051505.1846933-1-midnight@trainwit.ch>
 <20250202051505.1846933-2-midnight@trainwit.ch>
 <b76bf940-ff55-4619-a9ae-fa65c47e864f@ventanamicro.com>
 <8149beba-66b1-4707-93f1-083b8bc5ece0@app.fastmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Mon, 03 Feb 2025 14:15:39 +0000
Message-ID: <87jza7azck.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Julia <midnight@trainwit.ch> writes:

>> This happens because 'pte' is a 'target_ulong' type that, for riscv32, w=
ill be
>> interpreted as uint32_t while the FMT being used is PRIx64.
>>
>> You can fix it by using TARGET_FMT_lx instead of PRIx64:
>>
>
> I've sent a follow-up patch fixing these build errors, it builds on 32 & =
64 bit on my system. Cheers=20
>
> As for the Signed-off-by, I'd rather not, and the contributing guide
> does not require it.

Apologies - I missed the context.

  The name used with =E2=80=9CSigned-off-by=E2=80=9D does not need to be yo=
ur legal name,
  nor birth name, nor appear on any government ID. It is the identity you
  choose to be known by in the community, but should not be anonymous, nor
  misrepresent whom you are.

>
> Regards,
> Julia

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

