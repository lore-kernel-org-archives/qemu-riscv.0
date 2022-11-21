Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ox7v8-0007Db-Ho
	for mharc-qemu-riscv@gnu.org; Mon, 21 Nov 2022 09:37:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox7v5-0007CV-UX
 for qemu-riscv@nongnu.org; Mon, 21 Nov 2022 09:37:11 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox7v3-0004LW-23
 for qemu-riscv@nongnu.org; Mon, 21 Nov 2022 09:37:11 -0500
Received: by mail-pg1-x533.google.com with SMTP id 62so11285121pgb.13
 for <qemu-riscv@nongnu.org>; Mon, 21 Nov 2022 06:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MF0QvKrp6hOQBtpvzpbZb9Nyv7bn72nzIE9/cJbusOs=;
 b=gAF9+h1FXftdn93KZTEjjDjaUCyTsHBSfToTrxl4r+YHMi8217bNdmt8rUp15v69yz
 pJobNxAirgRt/WgG8aM2N9KWOH38GLcekaDFXyvNucTfg3VMCIR1/wW3ZD1A1EQTFOXa
 HJFiAiKwOwDK2L1loNXFrILdB6Cl+9GipWvvJ4ALhi/BT/LMmi0yoXZzfHbUb2H0Z+0x
 OyJ+cTLxJi1qhIBIRGnUuNIpd1czWWcgm58y1co5I0A44i9Y5aIgPBhIwo4fdBEp0u0o
 Lb/JRsVglFquVnJi6KlZXPCmzemQRNxdpoNdo6U7Qng0qy1m+qjI8IFNczK7FKNs1Bva
 R7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MF0QvKrp6hOQBtpvzpbZb9Nyv7bn72nzIE9/cJbusOs=;
 b=rvCA+TwT92Rqv6pDLvq2tQUyYhEojDjYCysU9x7ZPlY2rEpFQPh1DZmpU+y6FjmKy6
 ZW7Qyo+3Fbk+biKB/M4WZRZOL4p041tnPf9p8ReVYo3GcsN2EMAoEtwHDg5ecKjx3Dxl
 3SlNL29DwlQ0ChALrVpF5Z2Qo2bmKB7Itdz9HOMTnCGUzthsmMKCM6w/MlrfDoYP0uDQ
 V45TcyLHJ0F5T75FgRv7J3Cyv0c5V1Ac4+NxOth7OntuyrpQrL79956huFE6lIO12cbj
 wMiuzucSjj/mxhJqAcadqtoS4NHEtBn3vUdbkLTpQ6khLggN2kMEjEoAHwbzTON0Yc7n
 ebNA==
X-Gm-Message-State: ANoB5pl/71a3aEX022OUc/Ux346zbnfDTgpweVRjgSlgIKyeDU81fy+I
 eiY5lwAf+uGivtIYBL8SaJnIswGiJ3oeFsIqR9H9/A==
X-Google-Smtp-Source: AA0mqf7XWU9N5SiHEU9iGBhv7ygjljT7Go21HzZUO70MXU3z+uR5++ls9lOhi4M698xezvBVrH05aD10d6fkEhiYkHE=
X-Received: by 2002:a65:45c5:0:b0:46b:2753:2a60 with SMTP id
 m5-20020a6545c5000000b0046b27532a60mr1819319pgr.192.1669041427555; Mon, 21
 Nov 2022 06:37:07 -0800 (PST)
MIME-Version: 1.0
References: <20221121140121.1079100-1-armbru@redhat.com>
In-Reply-To: <20221121140121.1079100-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Nov 2022 14:36:56 +0000
Message-ID: <CAFEAcA_jnbp36Trjd3qJYzbf5-6SNNrirG7q2_-wKXkcX49ptg@mail.gmail.com>
Subject: Re: [PATCH] cleanup: Tweak and re-run return_directly.cocci
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, Alistair.Francis@wdc.com, 
 bin.meng@windriver.com, palmer@dabbelt.com, marcandre.lureau@redhat.com, 
 pbonzini@redhat.com, yuval.shaia.ml@gmail.com, marcel.apfelbaum@gmail.com, 
 mst@redhat.com, quintela@redhat.com, dgilbert@redhat.com, 
 pavel.dovgaluk@ispras.ru, alex.bennee@linaro.org, peterx@redhat.com, 
 david@redhat.com, philmd@linaro.org, mrolnik@gmail.com, gaosong@loongson.cn, 
 yangxiaojuan@loongson.cn, aurelien@aurel32.net, jiaxun.yang@flygoat.com, 
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, berrange@redhat.com, 
 thuth@redhat.com, lvivier@redhat.com, suhang16@mails.ucas.ac.cn, 
 chen.zhang@intel.com, lizhijian@fujitsu.com, stefanha@redhat.com, 
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, 
 virtio-fs@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x533.google.com
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
X-List-Received-Date: Mon, 21 Nov 2022 14:37:12 -0000

On Mon, 21 Nov 2022 at 14:03, Markus Armbruster <armbru@redhat.com> wrote:
>
> Tweak the semantic patch to drop redundant parenthesis around the
> return expression.
>
> Coccinelle drops comments in hw/rdma/vmw/pvrdma_cmd.c; restored
> manually.
>
> Coccinelle messes up vmdk_co_create(), not sure why.  Transformed
> manually.
>
> Line breaks in target/avr/cpu.h and hw/rdma/vmw/pvrdma_cmd.c tidied up
> manually.
>
> Whitespace in fuse_reply_iov() tidied up manually.
>
> checkpatch.pl complains "return of an errno should typically be -ve"
> two times for hw/9pfs/9p-synth.c.  Preexisting, the patch merely makes
> it visible to checkpatch.pl.
>
> checkpatch.pl complains "return is not a function, parentheses are not
> required" three times for target/mips/tcg/dsp_helper.c.  False
> positives.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

>  .../user/ase/msa/bit-count/test_msa_nloc_b.c  |   9 +-
>  .../user/ase/msa/bit-count/test_msa_nloc_d.c  |   9 +-
[snip long list of other mips test files]

>  328 files changed, 989 insertions(+), 2099 deletions(-)

This patch seems to almost entirely be huge because of these
mips test case files. Are they specific to QEMU or are they
effectively a 3rd-party import that it doesn't make sense
to make local changes to?

I definitely don't think you should put manual tidying changes
in the same patch as 3000 lines of automated changes: that
is in my opinion un-reviewable.

thanks
-- PMM

