Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CEFC624CF
	for <qemu-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 10:06:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1LNw-0001pF-Ff; Tue, 01 Sep 2026 06:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x1LNu-0001p0-95
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 06:06:30 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x1LNr-0000kw-TU
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 06:06:30 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-48433fad54aso1646571f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 03:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788257185; x=1788861985; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=pXXXFGiAJ4nqD2E+RTxDcOPrNQeXZ44Vn9yF8+Pol40=;
 b=u7gEq6eG38SdQIfewkDCyMTJBbXx/WRePoaAVRFQO/IdTiln5aQ9knzsjoFYUDDjET
 2SMK5NqFUiVkJbMhkhsq1LW6lyrDQnNBCKnHyQnBzn+k30GKJeN6h0ZBL+Ef8I5COIEG
 CzQqqEgIsltxgmY9sIOiyE4+SKNpbBKEZoc1V4Wi/6BTZOywn3ML0hGgwEDuzuAntUQS
 UYhTN8adoqvwbvZWUEdhhRO/H9qMWXNXvTV29+Zt5NDLngZN4fSTwU8wURRWkb3xHjOG
 Zq9W2vzMZoglv3huoBArdncNaDzkotldLXabIN54ZoR1zuI9XfZBAfI1MtS4/aAq3+/q
 rAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788257185; x=1788861985;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pXXXFGiAJ4nqD2E+RTxDcOPrNQeXZ44Vn9yF8+Pol40=;
 b=UddSFQx3pX79w8AcTRPoXC63qtr5Cu/Nyiuef6GrrfXvINjH72jgc36XdBJ8Z9CFw2
 Z1qkvTG9EG0LtvKcl/H8g06s4GugyI4xlQJn2hiqR/FVmDipd9B1yB1h0PdQuADSweER
 WuvWTiTVKJXNYdOLFcgHvVvODaUj/hsY7rv3iFXQZVcrPMeTnQcoLfk3vkzAo2fgx9HE
 ueB8tuvGf+WBVGeRvyUxJrQNV3Bfxn/t0dYj59MLeu0SmBM/Unya/N7HjmyCGZ4aCEMk
 b+NPxWKfn+scwAKQEDq48xSPerAcGFVUPYhBql/uGHwQHdzWWEbGTBe/kiIpTklWx85Q
 w7BQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxTUna5IHxeTTYEiOzMk8tP8UmsNemKA13qkxrRZzPF4i82wX3ugJiDafRYzGh3QOkcOPbgAnenjJoE@nongnu.org
X-Gm-Message-State: AFuF++nmAV/FHhEmBnx3C90iq5P1a0nra7gl5wJbM5ZPzzd6grs6ts+7
 4bFRZTnCfl8D3zmbOFJrpDmllELQO69QRnWQkLE/v/15X/a2OUTfUJXZqOLgaDDDNuc=
X-Gm-Gg: AYBFou16o+KqstJZo+gwDgpYdUSXFNWrJGw2COD47yZehyBxIaWnpEx4HJE9Uvcu13I
 7j/CbmWxHVKm/kUB18eP/+273OCdWUMXNz9jK9ioNbrhsy/8u7kDsarPNJZT0P1jMMVgn6G+O1l
 E6c5FQjl6DchR923ati84fdqbLLE3i5JKDu1NltZrqf0+recuCJoc1awnZH1BrJnj8yeEOn1+hB
 QzT3WUiwt5xig2iSta6eD+bo02ERGULnWT4jUCyj1aITMdhunCS8ki6OxKaO0FV68dD1gg/CRFV
 jqljCbGX+ViPedBLZBv1YIq6wGmjPR+S+x969y1eZcIqOG4PVF7TzSbqjpRK2I8GTUUgVW8SoMo
 xw5tyUFl7dsrgQTMf6gR7rSC/T7oEbOqspUHf9hCzxpRPC6EJGTbyAgSQSJOVzuqo/yWpFOtEwA
 VQJK4x14avvQa1RyGxSudhvJCj8QT1iWoseadIH7CWa62FpzzwPHK5twZxcuCRTekhob9+UHo=
X-Received: by 2002:a05:6000:1147:b0:484:3334:9dc2 with SMTP id
 ffacd0b85a97d-48440ffa457mr10054452f8f.15.1788257185169; 
 Tue, 01 Sep 2026 03:06:25 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48442d36e9csm4163178f8f.3.2026.09.01.03.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 03:06:24 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2F0215F829;
 Tue, 01 Sep 2026 11:06:23 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Alistair Francis <alistair.francis@wdc.com>,  Daniel Henrique Barboza
 <daniel.barboza@oss.qualcomm.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,  Weiwei Li
 <liwei1518@gmail.com>,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,  Chao
 Liu <chao.liu@processmission.com>,  Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,  Michael Ellerman
 <mpe@kernel.org>,  Portia Stephens <portias@oss.tenstorrent.com>,
 qemu-riscv@nongnu.org,  qemu-devel@nongnu.org,  qemu-arm@nongnu.org
Subject: Re: [PATCH 09/12] tests/tcg/multiarch: Fix vectorisation of memory
 test
In-Reply-To: <20260827050953.67184-10-joel@jms.id.au> (Joel Stanley's message
 of "Thu, 27 Aug 2026 14:39:48 +0930")
References: <20260827050953.67184-1-joel@jms.id.au>
 <20260827050953.67184-10-joel@jms.id.au>
User-Agent: mu4e 1.14.4-pre1; emacs 30.1
Date: Tue, 01 Sep 2026 11:06:23 +0100
Message-ID: <87cxuxwajk.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Joel Stanley <joel@jms.id.au> writes:

> Compilers are not able to vectorise the load and store loops. Building
> with -fopt-info-vec-missed with gcc 16.1:
>
>   missed: statement clobbers memory: ml_printf (".");
>
> This can be fixed by doing the printf after the loops.
>
> Also, autovectorisation doesn't like more than one if statement in the
> loop:
>
>   missed: not vectorized: unsupported control flow in loop.
>
> By combining them into ternary statements and one if, the loops are able
> to be vectorised with both loads and stores.
>
> The trade off is the dots are gone, and the tests no longer report fine
> grained miscompares. A failure does report the number of bad elements in
> a failing test loop.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

