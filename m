Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9285C5DF98
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 06:01:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyNjQ-0007AH-K5; Mon, 24 Aug 2026 02:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wyNjA-0006Wq-6G
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 02:00:14 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wyNj7-0004tp-TP
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 02:00:11 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-66c8e41f703so3590310d50.1
 for <qemu-riscv@nongnu.org>; Sun, 23 Aug 2026 23:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787551208; cv=none;
 d=google.com; s=arc-20260327;
 b=ff+SnEGAcqMHFk5KHKOyanr0sBLVKiWjfhqWCLStap4MaseZ6zzErDZW6+iWc9n99K
 pNLvn5p2iYNMi8KdIYdbPw97i+PEoYPUpPA/UTdl8U4Wtiwi4J4a5PAwk7KPhE4POCA6
 gz5mkjmUNS10HwLDAVTYN4liYf696/Q27/BDLs7/NLFInxzgz7cTJGDakpjLL/gYWCXI
 SI4ACLn4RTAbUIADRBURwNJaQ8irrsXTaGEmerSD+eOUvNf48gJNFz8cESQTgw5CVkFY
 6vEd/Px94rp8etbjk00YrUYh/I8lZwTHGXu5kRZlKw2qBd4Q9oKkRsfN61dbzp8ZGdcv
 ceSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=pCDl5Yo9QZmUe9jOqY9aOMSSsAye7TXfTZrSmYiRVhE=;
 fh=Bty9JZw36fDyA3Emht4AWxKJ1xVnulYWUNs2lTGy3wM=;
 b=PmuEBkRW1p8cT1wS+5o/z/ygw6m8olJasEE3dDW9W3mR/E9bwVJTmGBUQYl8/VyFQr
 EEJnQyVPR2Z16E23CQ6R50yHvKADf+4V7nGx0tS0jOY0I8R4dE6Ql/iTZszyO9IpU+4s
 SW8vG2goHreNrSNi+X/dUNC2W1hiwXKDl6FqHnMqceEY6PEx5rTRp4+x4mMxPJoPwdNl
 D+aeiOcvY9p9K9b/KSWcTBp9SK0SE9aJu4ECAncMGVn4ohVZCHdBzHV8vDydB2LlKDZb
 sskMUPSq+mrwWNBCFP4ICKL0Q+pwKBZyMwVlVexeFzjDhs6GKnG2D9o2E2sAMbouFqzk
 HtOQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1787551208; x=1788156008; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=pCDl5Yo9QZmUe9jOqY9aOMSSsAye7TXfTZrSmYiRVhE=;
 b=kYuHY7yMcFbnWVE6KHq9f7KoWkQcmS++yU9ba7WcSdlxnHvevSTy7r24mQ9qfcKR82
 S2L+cpcst7GaWnlsqfbuv/MpzKwy2FnSYEEg4ZFGtHup5XYPwd5zh+LY9qVP+EEYQmfI
 09UhS/JVOCfF/QUbO9GhWSzZMuZuJmcPGndfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787551208; x=1788156008;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=pCDl5Yo9QZmUe9jOqY9aOMSSsAye7TXfTZrSmYiRVhE=;
 b=S52G5fKNQNte5t6HqSoCpJq6atscB62fVaG44wc9iO2rxqzkg214HoGIIWjOONhDEI
 jwiICH2XKFSIb+i/oqCuS8emTdNBuBFAPn9I7n3Wh5kxxwJzJZBUMlY/vkiNUVOXi/PQ
 TR2ZNJ2oHWSP1i2AsFmOaRunOeFqcsXyWu6aQR4ahS56bxG1X1J0BLAgWcm//yl/nuQZ
 K9d+kYwD6z5qwWa7DBu5Oaw4xzYPIGQCFSMVVjYk1lYDmtER6Pi6oVEPNF5w9lVaJrAU
 ALaB6yDNhgI/WzowVhhIStkgy6GIDdjQwKqb+u3nK1zQnm7wC/4Xs1pfZinUgYJ/2ceO
 si1w==
X-Forwarded-Encrypted: i=1;
 AHgh+RqMQA6V1+MQseQgDA1WymjTbt7mveKDhpie9/Km6m9vhuBaEO3VOpKuas/D2uJrz+sWKLZiDnhPqhBe@nongnu.org
X-Gm-Message-State: AFuF++mhQ/6OQJ5zWZbTh8z5WbJeuIWqS8xCu0cDmb42StUoedbvoxew
 pEckSoSoEmaOYHSZMwENZ1kWxr900crf9elkconfatg47WdEfW4qtE7R37C5Msr3/Bs2zQD30xl
 Ala4qT45I/qQYa2SlJGQVsfYgmV1cOpA=
X-Gm-Gg: AR+sD10is3ific1NdnDjb/VWmvBViDx4DnM222kSqkdc/MLnbqcQusEG0vkqv4j8ZCM
 HGFReVdGfCyVFzam1IKGLXrlDuS65oYj6YaKu6F45yh4b1UKpmeyYvX3sMJ5Ep4UhfXHEuDEt9L
 uXrCkxftE+LrtY5n7SOsssadLlaIMWeuX5FjjcjHSIt1JQIlfpzaDgGFvJs9kRpgVGahkfBIQ6Q
 ubf1aCzP1Au8Bk5zMHt0mw/7sR7IMGQPXgrJVHDQEZWQURTQuNLaqkhFzEfUC4gHtWuN7m07IhM
 Ut7wMueWd4vhJBAoEVkDHy6CbosPs/NL/snqH9p5rvVJGm1zHyx4pKcxGIlJzrvLE/U/ZWtZZhT
 +AiAna7IHI23XY+QbiV+NlaU/g6UtxLwAQo/tlmlr+O5HvbXZk7csniJAlDXSWWYzowdexs+uRC
 87FxwHROzz0pqqqaUv0Jz7TEXMp1Y=
X-Received: by 2002:a05:690e:4892:10b0:66b:30cf:64fe with SMTP id
 956f58d0204a3-66ce4acfebdmr5870413d50.26.1787551208584; Sun, 23 Aug 2026
 23:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260824055642.41098-1-joel@jms.id.au>
In-Reply-To: <20260824055642.41098-1-joel@jms.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 24 Aug 2026 15:29:57 +0930
X-Gm-Features: AcwNN1Xxk_LOJMsUoMWZOir6fx-rUViw4NLZg-zbqq6B5aMdrYwB0b_b1PN9JpE
Message-ID: <CACPK8Xd4dhaiQi4ZgP4d2yC3BtEQM0WbUb=DhoD+94jsN56b9A@mail.gmail.com>
Subject: Re: [PATCH 0/4] hw/riscv: Post-review cleanups
To: Alistair Francis <alistair.francis@wdc.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 philmd@oss.qualcomm.com
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>, 
 Portia Stephens <portias@oss.tenstorrent.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=joel.stan@gmail.com; helo=mail-yx1-xb135.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, 24 Aug 2026 at 15:27, Joel Stanley <joel@jms.id.au> wrote:
>
> Phil made a bunch of suggestions during the Atlantis review for things
> to clean up afterwards. Here are those cleanups. The patches are
> otherwise unrelated.

Doh, sorry, patches went to Phil's old address. Adding him to cc here.

Cheers,

Joel

