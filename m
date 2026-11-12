Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A251606A33D
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 13:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V85DtD2j
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xRV0Z-0004tX-8T; Thu, 12 Nov 2026 08:38:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xRUzn-0003nJ-Ut
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 08:37:44 -0500
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xRUzk-0001wr-EE
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 08:37:42 -0500
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-67be4686827so3534278d50.2
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 05:37:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794490659; cv=none;
 d=google.com; s=arc-20260327;
 b=jYaTym96EUUSEbFgn1IrNa1Y+mxTXwBwrKc6zHM/UgiHTPsOn09CHka2Erl5ya3g6E
 GOEEkH3K/RE5D4SEWkmBv8iBp4DPlYMdNwWOQmpWxhYTrAiU0yfYTMPbXDgROTZ80LAX
 L18gOfITb65bJl+3IwqE0w9rShCwjjONqQYh4tmDYEgH01NTum4WKJD0Tz6EP8FGW0pj
 eNqr9ZyDag8a1CGq7hksfAixm72avitoWeNkq2u9reWBk8EmSVc90DHld1H6nYYaJc5O
 IHHfkt+FcbMuZWXumtpMvKeD1p5vXdKoc3oyKPN74Twz1YpphN4uGLVeODdERZfphs0Y
 tG2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=wQPUvIXNYS48s2Q4jDpTRSsnQIcmcLIDMkdERd2E5k0=;
 fh=CUZ1u99uSOfZAkQNEYOHjPTEqKUCrI1KKqzgUQ/WMFQ=;
 b=A9QuhM525/0T0+xBU6eF7oLCBQBfjSGNKJTmLVLd9ZZk+kCJ1Jx6JQxfcNY6azjEDq
 F8deoO2xKfijB2Wj0DZShrYsmG/gd/jY8yVVO0eSAk/B9PfZPWdQ48ktqOgUbomAgCrD
 IqbwGkjPR84RZO2CYWRxPLVl4FVo+i5o6DAfh0FKKjwjc7ynA0kTgKtSj7yTkkcrs0Dq
 Bd2YG8xpS6hba6jv9O3SKOX3R2WSywgGdoAZXFhwkEJ4aIiYq6Ohb5eI7DG+s1Y7UNnl
 6zxDmRRNw1Io1fQVby0FC4UPB1ivMnPlIo8TQ7QoEc7QWya7ME9s2Ba6qF/kktG8uk3E
 rSzg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794490659; x=1795095459; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=wQPUvIXNYS48s2Q4jDpTRSsnQIcmcLIDMkdERd2E5k0=;
 b=V85DtD2jffG4O0+/bWgnUFSXOwlyx/YZbEq8X0rtg6vbGE5AE5dezZ7tRmjdonQNm5
 0Q3HAfTXC7HJvF9NtDlFosIo8X2Rq+7eLEMD6pwRRjnKWI9fQa6ISPHlspcIf+qXRzF1
 NLhuucBqOMUgwxwIyoqkIyNYEZP//6QfTIq1K+6ilmjBiOIqVb7cXE/RUohNng6ZUeJp
 WuMjchKDCduwv41IOr8lMlNU+TpY1GONoPkGEgYDjnlE4be/hM1HX2WLudAwavaP7DWp
 RhhF3aTxUf3YKc2szu4LzYgLX0+f18vJCKmYbZoxeEDWIljaCWUzuQMuFKCNJwtklzsi
 649A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794490659; x=1795095459;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wQPUvIXNYS48s2Q4jDpTRSsnQIcmcLIDMkdERd2E5k0=;
 b=NyRtz7ae1kag1NqnC25czR92BEIO6KhWSN1ItaBlPZAoenDnbYselm5jRgqPw6bxXP
 xeFUEK2RqLtT43vzI9eETSi8lxLg8FkY30yRxYg7BmZY3m0f7gzvQ6/bXtsbMq2uCLAL
 gFUgiYIkVigiRevVjJUdaC/0cvDRNPWx+eyGHlkyVd1BcvYfHVY7g60ye4j0LmPti8CA
 JRFtqwcaR16jf0KTzbYS/aApGtlw1ipuJAJOxQa+TtBXOZX+Xs4dj+tiSWNYOmhGR39h
 fXQ1C8I0PqpMNGEU8y+4XuPlMdX6yoGRFi/k7mvAtQNdQCZfbiK1kNYtBHHOppx6cRvS
 3S0Q==
X-Forwarded-Encrypted: i=1;
 AL+hErFfIdoiaWXBFrmKvAhsM+zMqFYzj67jjiw2xUBe7sfkdMVFS8YHf9w5/CHFfk1+EOoIYyAh8CpchjMa@nongnu.org
X-Gm-Message-State: APuU4Z+6ylvnszB+72QFIzJZpCKxyMBGWs8lyAlHqesr7W2pdsFUyp5v
 wakYB66NXTHg258XTuPP2C0Ku8tEq0NJzJKaUWIacRd+CTPVsGfw/sItw12XFDkqxEfng6i+Z9e
 r115Qg9fqRpN9We/tZPjtx2QD7hx/SViDPNj/0bcVGw==
X-Gm-Gg: AYBFou1kaza3w+Z9Q94GaedHbuuA2Gc0SxVCELCPxYZeKqmkjIPdKoG4ERL/S/GOnJ9
 box0IvwuYcmnGU8RNmJyVH34szC8SMH9ziN67T7YrgCNif6lHMVOxjqdZjYBxd6CQLiLmCVa+aH
 2nKxlSWttArTh5CSZfXPUrJdpjc5R1LhEnq6wTmusuzr2hObWkoyIMGOrWsEiCDOh/omL9d7CDh
 tu0CuEF/DbMKB5VqA2Bb6ypqT0+Z9XGGooz8b0DL/vEniLVc7RFMWf5m0D80tBrYaVEJWpFkhN6
 FIiJMvoUoORGMC6rACxRSm+m3M6M56al2fE9+qNACcYVZo4Nvv13NpsLqRefSwjE0imSaK/6ZeW
 R5JlktPZXK/3w9nSwAS7XNtSKqJnU14kK8eUdHKDV7KDJVCqZKM+4SQ5SvYjiAlI2FHQE2dveng
 b65Tp3h3Nhg8Gt+M3EGzVTsZAXpB3uwfN559vA99CWZw==
X-Received: by 2002:a05:690e:4891:10b0:67a:4c43:3bab with SMTP id
 956f58d0204a3-67c67f8e63dmr3044344d50.60.1794490658700; Thu, 12 Nov 2026
 05:37:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112133320.418012-2-marcandre.lureau@redhat.com>
In-Reply-To: <20261112133320.418012-2-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2026 13:37:27 +0000
X-Gm-Features: AclHuK-cqP2cgM_oSm9DSQRHE_AYyWmHEKxBSE_SSc8G4E633pLI4E1-fCSXekA
Message-ID: <CAFEAcA_qh9FuCtOeOob3GVYA14oXZAb4Pv6WDGq5pbp4k-cZyw@mail.gmail.com>
Subject: Re: [PATCH v2] tests/functional: use immutable tuxboot kernel URLs
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Kuan-Wei Chiu <visitorckw@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, Joel Stanley <joel@jms.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>, 
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, 
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 12 Nov 2026 at 13:33, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> tuxboot rebuilds the 6.18.54 kernel images in place, so the URLs
> without a datestamp now serve content that does not match the recorded
> hashes and the tuxrun tests fail to fetch their assets. Point the
> x86_64, arm64 and s390 tests at the immutable 20260930 snapshots and
> keep the hashes that were recorded against them, instead of implicitly
> switching to the rebuilt images.
>
> Do the same for the riscv64 6.11.9 kernel assets, which still used
> non-datestamped URLs; their recorded hashes already match the 20241122
> snapshot.
>
> Fixes: 8ac1aab21fca ("tests/functional: update arm64 tuxrun images")
> Fixes: 09961fafc5a0 ("tests/functional: update s390x tuxrun images")
> Fixes: 467c9eb7dd31 ("tests/functional: update x86_64 tuxrun images")
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

