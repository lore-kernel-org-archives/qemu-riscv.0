Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A8DCD98F0
	for <qemu-riscv@archiver.kernel.org>; Sun, 21 Jun 2026 23:59:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbS3x-0002DM-6g; Sun, 21 Jun 2026 19:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbS3v-00020S-4k
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 19:58:51 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbS3t-0005DS-3y
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 19:58:50 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-697ad7f663cso536017a12.1
 for <qemu-riscv@nongnu.org>; Sun, 21 Jun 2026 16:58:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782086328; cv=none;
 d=google.com; s=arc-20240605;
 b=EkS4lY+oLaqtXIUvkNmSCWwQ+TnNkKJSumRoiNE1XDOztQCR+oGu44MFVrWMo8HCtC
 5mHPEtxyFiDVHdOeOIYPd6eqcan/Ze30WsXcSlARlfHSKQfk6XG/3yhk767uIQmgRze9
 +ZWsB0Om4kCVekSWnzW1mgXbRvFqdp3rmW8kMKYafYtAj4TZVhUBmmlVlPTp8egPgGze
 l3/DUHYjKqplMe6mX4GfRbya59+ovUJGgcfHQgjwDgaMMb0Gd4u3sKVEG6d1dUxx3P5J
 yhVYgXd9m7MIQXkBItthMdTqr0rXDQEDwwMQpw6zipWmOiMJxyemB3J2tlXHZ6c8DKBp
 wgkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=EHPFtTicEuji0gMbdV8rYpEMYYOEvStiQqxpsqp7OnM=;
 fh=MpINcvG8jYHe2U7kruTVoFxZmJstufymLJKzFTtpSJk=;
 b=gKFmNwOzjq+FMRqkyxKfZ2rumlICrVrhB9haRNfG7kEDnb1A+6ZHTtgLcZkbUNk9yA
 QWwoLjgTCaMmxAVFykaf3Z21jHIYjLHWeso34yS2SAmTs3vNs2h4x29hQtBupWtH52sd
 yqvcRbYXq9q4X/TRvSXhEg2WE++tTlrI1jipP8rcri4FtCWRAC2Si2BVTXEGNTZVwFLk
 6/p32aOipZXA5xIuKtZ43s67hg45FBBLEsXFHJ/LR48cjwcJzrGhXFi8IenBu3fHM4+X
 hzps2N7sbyKffbjW5EpauTB1iCSou1NaYguyCF5Q9B9GidOXdJl3K0zEWr+UtjZj5yXP
 eeiw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782086327; x=1782691127; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EHPFtTicEuji0gMbdV8rYpEMYYOEvStiQqxpsqp7OnM=;
 b=LaAGizLzdayrHhGfe3mIWvjAgRNPcX7WdYDxBXW2KPmRiiu9+WvwmOOaTedpW0AF/X
 2kGdNluHez+dBSXYMT8BKW1el6gHWrViL92Q7sBxNDcNfrmtq0nk+MJNzHlHwzsbyWsL
 1W4D+uMOwDVA+DFZgXOl9y5sBjQTGutbpMOpc95CFx12dmEtyxySxNFNT3+rTTRknwm+
 VqGstFHksc6hNh9FEUiPXN+QZt9bxFFkuR4IE23aa4vWVrZ1fk7D4PCBJHQEauS/Kl6U
 rMm5OK/0t1XCjKBFA0zIoyKy4Gme8uTd4izVCOoRUu1IW7WF76CbTIWScANFmKYChvQA
 LIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782086328; x=1782691128;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EHPFtTicEuji0gMbdV8rYpEMYYOEvStiQqxpsqp7OnM=;
 b=MeRfyhA246F6anAz04uDXVs5wAJl3Ox3hJApsxXV7AgKaNXSBuTUSOvtkJwNNnm1Ie
 k1KreK1/NJFY77o3QJcBDSa2JStND6Otx3mEqsnysZwlL3G0vpnbSXbaENae5r+wTJww
 48mj2oC5auYqC4m+BJ38XflcuJYY/SfVAx/TFg3RXfZRm034M1JQ3QbSCzfhdBSUCc/M
 ocTqpUWPCrctkJLPlKupHvbPnAO3l41k9ddIz5fqBPYGrLM147jLayi97Jo7pWu2ilMe
 mfXBf00t+0n5KYe3O8TdH6AhjlAesGs1EUkfe00mW0jsfwkPOcBJHXalc+ts6BsZxBoW
 69hQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+OzZlHqJZblqFgMsZmY3RBuzD/fYoEYiX4PGgeAMxA7GkSPX4V1vPmlOOn3C5o7VX5ojojXqI+zGQX@nongnu.org
X-Gm-Message-State: AOJu0Yw/D5hqu1xO6VQqYXkB1kDxFmgOzEbcDK6u8pE+ClCrIEFvq+pD
 Uu+6G7Cy3PcD2hbqSe+JYRIuSw9eSCeWK11L7Ap4YpsvOZREaw0gOGIC0BE50F8oT/tQXojZqWq
 C16VG14DQLOUaJbJ4kkm0uv/rsPi5SQ9yROKJffg=
X-Gm-Gg: AfdE7ckKx6w4znfw8dkneGg70C+nImf8GTT92KDQHBU7kjSMPufoPu/JeG2Id89f8uA
 1Jd2Ze8GnQaEmiuCnOTv5HmZ2lWETjZh/euP4aY1i6hEy3ZMos8fVdmqX9mLSFAShOOoAw5G6ku
 cU6oBVy3c5NDIuJzKbh56QCNgFDemIcR2q8JnHjsyldrospiuwGDlSiqKCpkUKn8f/8lL/FVKez
 VX0qfR93brBAjihmBvNBDmL8WUz+8xOZjnXwjmXYK2LMNHeaBv3DjuAlC7d5EGeVtNYy/ehA6jV
 ulaaOM1g6WCilv3b1YcXBCfMZVs=
X-Received: by 2002:a05:6402:254c:b0:697:833b:8463 with SMTP id
 4fb4d7f45d1cf-697833b86e3mr2374559a12.2.1782086327401; Sun, 21 Jun 2026
 16:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260617054034.1020724-1-joel@jms.id.au>
 <20260617054034.1020724-4-joel@jms.id.au>
In-Reply-To: <20260617054034.1020724-4-joel@jms.id.au>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jun 2026 09:58:21 +1000
X-Gm-Features: AVVi8Cd5G5tpCXRPfl3wKhUjTuWteCkBv-QD1TjOQWiOTaIwPzTX0s2ej6cAOvU
Message-ID: <CAKmqyKOnPotfp4HPx9gFmRPRbvH=vnjvacwoaA_qOH=aUj9dSg@mail.gmail.com>
Subject: Re: [PATCH 3/3] tests/functional/riscv64: Add virt machine AIA boot
 test
To: Joel Stanley <joel@jms.id.au>
Cc: alistair.francis@wdc.com, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Anton Johansson <anjo@rev.ng>, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Wed, Jun 17, 2026 at 3:42=E2=80=AFPM Joel Stanley <joel@jms.id.au> wrote=
:
>
> Add coverage of the riscv64 virt machine's Advanced Interrupt
> Architecture models. With this the APLIC and IMSIC models are used by
> Linux, catching regressions.
>
> This test requires a kernel >=3D 6.10, as AIA drivers were added to Linux
> in 6.10.
>
> Boot time is ~5s on a laptop.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tests/functional/riscv64/test_tuxrun.py | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/tests/functional/riscv64/test_tuxrun.py b/tests/functional/r=
iscv64/test_tuxrun.py
> index 43d1242be52b..6203a45060ce 100755
> --- a/tests/functional/riscv64/test_tuxrun.py
> +++ b/tests/functional/riscv64/test_tuxrun.py
> @@ -41,6 +41,13 @@ def test_riscv64_maxcpu(self):
>          self.common_tuxrun(kernel_asset=3Dself.ASSET_RISCV64_KERNEL,
>                             rootfs_asset=3Dself.ASSET_RISCV64_ROOTFS)
>
> +    def test_riscv64_aia(self):
> +        self.set_machine('virt')
> +        self.vm.set_machine('virt,aia=3Daplic-imsic')
> +        self.cpu=3D'max'
> +        self.common_tuxrun(kernel_asset=3Dself.ASSET_RISCV64_KERNEL,
> +                           rootfs_asset=3Dself.ASSET_RISCV64_ROOTFS)
> +
>      def test_riscv64_rv32(self):
>          self.set_machine('virt')
>          self.cpu=3D'rv32'
> --
> 2.47.3
>
>

