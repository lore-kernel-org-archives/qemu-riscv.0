Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAA9EB64D8
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 13:01:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCJvE-0007eZ-U5; Thu, 22 Jun 2023 09:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlmgr@proulx.com>) id 1qCJ9X-0001Uc-PO
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 08:11:08 -0400
Received: from havoc.proulx.com ([198.99.81.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlmgr@proulx.com>) id 1qCJ9W-0003Tg-1S
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 08:11:07 -0400
Received: by havoc.proulx.com (Postfix, from userid 1027)
 id EB15A31C; Thu, 22 Jun 2023 06:11:03 -0600 (MDT)
Authentication-Results: havoc.proulx.com; dkim=pass (2048-bit key;
 unprotected) header.d=multicorewareinc-com.20221208.gappssmtp.com
 header.i=@multicorewareinc-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=ratK0+NA; dkim-atps=neutral
Resent-From: Mailing List Manager <mlmgr@proulx.com>
Resent-Date: Thu, 22 Jun 2023 06:11:03 -0600
Resent-Message-ID: <ZJQ6V4LMzIZjjmAX@havoc.proulx.com>
Resent-To: qemu-riscv@nongnu.org
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <siva63@multicorewareinc.com>)
 id 1qCEDJ-0005ls-GQ
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 02:54:42 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <siva63@multicorewareinc.com>)
 id 1qCEDH-0007e6-IY
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 02:54:41 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-25f0e0bbcaaso2351036a91.3
 for <qemu-riscv@nongnu.org>; Wed, 21 Jun 2023 23:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=multicorewareinc-com.20221208.gappssmtp.com; s=20221208; t=1687416877;
 x=1690008877; 
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qVHRHt5M4+Kpurp8xd7XOTQ8tvjBN5jsNn++Yea2qQk=;
 b=ratK0+NA4lPxrbloApyO3ZpWlQiyd7qFB7k6hSN+8nhmObawtRaEn4+K8l0Z0P7pem
 STkQZ9sa4l2m4nXs1xQkgk6yyRf4UHHMnXxc1vgDAv0tdRXiWWkoSmalEhSQ+juUMu0A
 GhUxlz1M7Ig2abZzpbDOb+XwYpTzbXv6hJ9ACMfXHMdj7i4yQqQQ/jFQOzisVVWBZmBT
 0l8r32DZnDvuditOz6EF99s8ZBuQKyEPXSKoDKCbT2taTZnjyuSGxln9mBDXB2IKe6Y3
 PiYIiSyn7H50HVPRUC4JdA5NFNebNtfXM+LI5FBumMfzy9tvDNWLx/0yVFCUNNhds4ls
 Wqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687416877; x=1690008877;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qVHRHt5M4+Kpurp8xd7XOTQ8tvjBN5jsNn++Yea2qQk=;
 b=ZAKdxXnQkrxmScnyh8pKLBkEMkF+/3CI1gJJZ/zhPgCbw2EyUTzFzltwXApSbIQwgH
 xbwBUmcYpIAyD654ZmvBCwf2TiPl78NG2wljCXSqvyCaqYFBqNETPhu1kSoux678OJrH
 lbId1QROARfj96tQtt6RBFYnJxkHrg9lnth50fvAd3cLp0CUd/+3IdUUmLiDKyBseepG
 B0YkqxNxCRtqW0VZ8m5xF04VLcqVqf8OTAE1TDKND1afxz68AechjAHyDbI/J/L5BaSE
 PWbAUojPlpqQdkJIJmvodM+R/x62OOYJ/E7efrocTHGZY7KGeadBhXw5zIPB5WqTlGc2
 RtdQ==
X-Gm-Message-State: AC+VfDxsFTfSn0hETj/HSsjMJdliXaAKohJUVy1zlVNM10u1deXkT18r
 HOtLTNxWkC9IeXK4dpPeVGcIZhlpfCqlsN2zSChC/xnAT/+TsFMD
X-Google-Smtp-Source: ACHHUZ75edZ8zRZwm3clbTJoi6yjiB4HJqv/DnllnlmQ6JzxS696JEkWi1pJqOWynrnvDlSpDTsUl1BsL3WzorPSgS4=
X-Received: by 2002:a17:90b:f90:b0:25b:e0fa:318e with SMTP id
 ft16-20020a17090b0f9000b0025be0fa318emr11316726pjb.2.1687416877042; Wed, 21
 Jun 2023 23:54:37 -0700 (PDT)
MIME-Version: 1.0
From: Sivachandran S <siva63@multicorewareinc.com>
Date: Thu, 22 Jun 2023 06:54:27 +0530
Message-ID: <CAL==hzEn=YoaFgiTj9Fm8bBPP7Ea==R=gZFyEO6JN8nSYyefLg@mail.gmail.com>
Subject: RISCV vector cryptography support
To: qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000008b64dc05feb25bff"
Received-SPF: permerror client-ip=2607:f8b0:4864:20::102e;
 envelope-from=siva63@multicorewareinc.com; helo=mail-pj1-x102e.google.com
X-Spam_action: no action
X-Listhelper-Id: 20230622005524-6778
X-Bogosity: Spam, tests=bogofilter, spamicity=1.000000, version=1.2.5
X-CRM114-Status: SPAM  (  -5.20  )
Received-SPF: pass client-ip=198.99.81.74; envelope-from=mlmgr@proulx.com;
 helo=havoc.proulx.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, HK_RANDOM_ENVFROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 22 Jun 2023 09:00:04 -0400
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

--0000000000008b64dc05feb25bff
Content-Type: text/plain; charset="UTF-8"

Hi,

We are working on the RISC-V virt platform for one of the projects. So I
would like to know whether the QEMU supports RISCV vector cryptographic
instructions. If so please let me know which QEMU version supports it.

Regards,
Siva.S

--0000000000008b64dc05feb25bff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>We are working=C2=A0on the RISC-V v=
irt platform for one of the projects. So I would like to know whether the Q=
EMU supports RISCV vector cryptographic instructions. If so please let me k=
now which QEMU version supports it.</div><div><br></div><div>Regards,</div>=
<div>Siva.S</div></div>

--0000000000008b64dc05feb25bff--


