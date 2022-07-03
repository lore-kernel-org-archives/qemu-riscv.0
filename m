Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o87zU-00053j-5o
	for mharc-qemu-riscv@gnu.org; Sun, 03 Jul 2022 18:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o87zS-00051Z-3Z
 for qemu-riscv@nongnu.org; Sun, 03 Jul 2022 18:22:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o87zN-0005SS-DV
 for qemu-riscv@nongnu.org; Sun, 03 Jul 2022 18:22:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656886968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TopUIyi2bDIF6ETHPUt7meggdZ6D+dZM/h35SyOKp7w=;
 b=FwNNCW05TU+fPvpw9KyjjYaN/EBwEwTTbpY938+RhkElLpzrBs/ofPf8G1KtuexNPKP+wa
 zvmjAfCrHX80NfUHcPVtmAJmmqzcrZ5wiAu9+xDEQYqb6NAX5koCvNfjirkYmDTLGN+z4B
 rWy/pFh51oxSGjqUOVZ4fVW7J16CzjM=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-aHFRFrUaMfKCb8IbfxaIag-1; Sun, 03 Jul 2022 18:22:48 -0400
X-MC-Unique: aHFRFrUaMfKCb8IbfxaIag-1
Received: by mail-il1-f200.google.com with SMTP id
 i2-20020a056e021d0200b002d8ff49e7c4so3319100ila.8
 for <qemu-riscv@nongnu.org>; Sun, 03 Jul 2022 15:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TopUIyi2bDIF6ETHPUt7meggdZ6D+dZM/h35SyOKp7w=;
 b=2Ijd9TDP1t5FDkv25oafu1MtUB5q2bagR9/aiXhVNypNgNjU6TndMcQsczCWmH17Yr
 jNTuNAf1SOHfaJXvYqCdSdBMyx3VDaaBdx9pMs7vIrS6JEaVH9qaH3mTGBStXsIExVvs
 53tsmt2fKc/xz3BhNYCsgu0mS2vpxENs1ATo9n+LgUjFcJDU/TtmCGQMNgslmthOhELI
 Grq8hA0hVmFr/TsBcFhAf8gaReRdL3g2CvTVVpFX8cTrl4ZUwbozYsOxNcQ4rW/lGhpv
 txFX6KP3jzzzB10ZIlznAycWfJgtRPoBXiy4wqogOG9CiLTGr1UYz9YKb57x7DSEHL03
 TJVg==
X-Gm-Message-State: AJIora8KBqbDVWG+2qHEEIvN4h9VpyuxsPh43Orc6O2GyRmZ3rzy9+7X
 lM3OQYuZZfNIbPQJo0+iBRgoLO6IrT8K9H8S0NU2sJQ1DbgUS/p/Uxnz+ITupt08dFXePDzGUJk
 GgTjymVBTxfHK4fcpjCTF/k52TJeyW8M=
X-Received: by 2002:a05:6e02:216b:b0:2da:c09b:179f with SMTP id
 s11-20020a056e02216b00b002dac09b179fmr15114461ilv.0.1656886967309; 
 Sun, 03 Jul 2022 15:22:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1so9PTysMD527QunKrHrJD2l4FDaKcL1yS1Mq8rOeXP34O6hwfbnSOzJYc/fvnyvutnCV+nMoIoRuXWuiw8OnI=
X-Received: by 2002:a05:6e02:216b:b0:2da:c09b:179f with SMTP id
 s11-20020a056e02216b00b002dac09b179fmr15114434ilv.0.1656886967102; Sun, 03
 Jul 2022 15:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220517113524.197910-1-afaria@redhat.com>
 <f36e2069-e1d8-462d-401f-1194139ee6c2@redhat.com>
In-Reply-To: <f36e2069-e1d8-462d-401f-1194139ee6c2@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Sun, 3 Jul 2022 23:22:11 +0100
Message-ID: <CAELaAXyf7_g7WQHrJUgYzhGCQhEm-D_zai2Qv_ugzWjm3z2hpg@mail.gmail.com>
Subject: Re: [PATCH 00/18] Make block-backend-io.h API more consistent
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 qemu-riscv@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Stefan Weil <sw@weilnetz.de>,
 Laurent Vivier <laurent@vivier.eu>, 
 "Denis V. Lunev" <den@openvz.org>, Juan Quintela <quintela@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, 
 Greg Kurz <groug@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 Bin Meng <bin.meng@windriver.com>, David Gibson <david@gibson.dropbear.id.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=afaria@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 03 Jul 2022 22:22:54 -0000

On Sat, Jul 2, 2022 at 3:12 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Alberto, does this need a rebase?

This applies cleanly on "[PATCH v5 00/10] Implement
bdrv_{pread,pwrite,pwrite_sync,pwrite_zeroes}() using
generated_co_wrapper" [1], which applies cleanly to master.

Alberto

[1] https://lore.kernel.org/qemu-devel/20220609152744.3891847-1-afaria@redhat.com/


