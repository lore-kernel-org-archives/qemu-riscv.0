Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oxUwc-0002gu-T3
	for mharc-qemu-riscv@gnu.org; Tue, 22 Nov 2022 10:12:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxUwb-0002eN-Mu
 for qemu-riscv@nongnu.org; Tue, 22 Nov 2022 10:12:17 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxUwY-0007AF-Po
 for qemu-riscv@nongnu.org; Tue, 22 Nov 2022 10:12:16 -0500
Received: by mail-pl1-x62a.google.com with SMTP id j12so13925386plj.5
 for <qemu-riscv@nongnu.org>; Tue, 22 Nov 2022 07:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1nJ5dQ+5Lp1BlK2QZdz2R4+7V24gqPvT5Ivb3k58a10=;
 b=EZ5o4DoE6gKVEK5uM6jPzg/pwusG8OxEpdOq6ND6QSMXA4pKvOm/NAZopy+AQq1cHQ
 2ZjXMV46bEfqDwrfpo/8N32R3Z/0AOOP5aeGZWEL58zKHQzlgtZs8aOhKpIR0fJDBwnz
 z2gehbiLgAr2vlTwoiOzF8CsJiksUQgu1JKBg0zkGGcKZaLjno5EhI0W5s+baz8dWl0o
 D49DWtqFctlfIf7K+SNxytX5XBLx2lortFsc0K8c9wh7imOkOJXS9FkZ/F5cO2U3CYPq
 auZsfoifz0Pq2e/pXBeABRP1dyfyc/RhzDSMBXfFKOQIkvJzk65fnMxYhyTxTh2oPF9P
 GYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1nJ5dQ+5Lp1BlK2QZdz2R4+7V24gqPvT5Ivb3k58a10=;
 b=JlrLKCZSIs3t+SD6EKtEi2Ory/G7ubczlxVSPTVP255AngiLYTpYxWKeq0PWWdO0VS
 ZEDMu2Dm7Qf/sjwXl/kR3+nBLzjTYK7vNSgr1ORcDE52wC7LtPg2/HSTUKhsXrqB3Iu+
 9oRqxh/IW4a5o/o9HLeJdIZ7Kfjbfuu9ihW0kvsSvvSBrpFedP7kAXx34T2ePXV7hPvV
 CKe4uMPB+YgZwkBzeHUSoBt36GncMOI7WF42zh+uxXx7dVrB3XygPPFYDaRzMNNgn9zx
 8ccAjk+uXU7Hh7aurQNLFC2lg/icv+Gwe+GD9YtlldSZUS/AuNPwMiao10eQkJ0uBeW/
 V0Zw==
X-Gm-Message-State: ANoB5pkwmVZZ19nCpBMyS1tsY0Fo9urMu/e3FDtnrwAfV49fbtLSEiEj
 fZeSKlS3lTi/2uirDDb2nEcRN7Oc3gyQdEcBV7FD8A==
X-Google-Smtp-Source: AA0mqf6hNvg86G/Fwpz0Ohih4Ff7tWssT1JhbqR8nrobyjQZ4llXqWoau5yXfw+e5+OBfnD1o6jA4BUPHhkqL17n+8Q=
X-Received: by 2002:a17:902:6505:b0:185:4ec3:c708 with SMTP id
 b5-20020a170902650500b001854ec3c708mr7203796plk.60.1669129933138; Tue, 22 Nov
 2022 07:12:13 -0800 (PST)
MIME-Version: 1.0
References: <20221121140121.1079100-1-armbru@redhat.com>
 <CAMo8BfKxve8=RKqT6S8XXy1E7hczF0VO9XXZeUpha_4xNSV6WA@mail.gmail.com>
 <506afd42-89ab-cc6a-42d7-4544244f8672@linaro.org>
In-Reply-To: <506afd42-89ab-cc6a-42d7-4544244f8672@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Nov 2022 15:12:01 +0000
Message-ID: <CAFEAcA87eRD2Y8PrXTQLF=LK63RnDN6sp4D2R+KOUd7Pp8y-yw@mail.gmail.com>
Subject: Re: [PATCH] cleanup: Tweak and re-run return_directly.cocci
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Max Filippov <jcmvbkbc@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, 
 fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com, groug@kaod.org, 
 qemu_oss@crudebyte.com, Alistair.Francis@wdc.com, bin.meng@windriver.com, 
 palmer@dabbelt.com, marcandre.lureau@redhat.com, pbonzini@redhat.com, 
 yuval.shaia.ml@gmail.com, marcel.apfelbaum@gmail.com, mst@redhat.com, 
 quintela@redhat.com, dgilbert@redhat.com, pavel.dovgaluk@ispras.ru, 
 alex.bennee@linaro.org, peterx@redhat.com, david@redhat.com, 
 mrolnik@gmail.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn, 
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com, 
 berrange@redhat.com, thuth@redhat.com, lvivier@redhat.com, 
 suhang16@mails.ucas.ac.cn, chen.zhang@intel.com, lizhijian@fujitsu.com, 
 stefanha@redhat.com, qemu-block@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-ppc@nongnu.org, virtio-fs@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
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
X-List-Received-Date: Tue, 22 Nov 2022 15:12:18 -0000

On Tue, 22 Nov 2022 at 15:04, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 21/11/22 17:42, Max Filippov wrote:
> > On Mon, Nov 21, 2022 at 6:01 AM Markus Armbruster <armbru@redhat.com> w=
rote:
> >>   .../xtensa/core-dsp3400/xtensa-modules.c.inc  | 136 +++++-----------=
--
> >>   target/xtensa/core-lx106/xtensa-modules.c.inc |  16 +--
> >
> > These files are generated and were imported from xtensa configuration
> > overlays, they're not supposed to be changed.
>
> Tools can get the repository file list using 'git ls-files', which
> itself support file pattern exclusion [*].
>
> We can create i.e. 'scripts/imported-files.txt' with:
>
>    linux-headers/
>    target/hexagon/imported/
>    target/xtensa/core*
>    tests/tcg/mips/user/

Good idea. scripts/clean-header-guards.pl also has these to add
to the exclude list:

include/standard-headers/
pc-bios/
tests/tcg/
tests/multiboot/

thanks
-- PMM

