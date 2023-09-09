Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B268CEEB57A
	for <qemu-riscv@archiver.kernel.org>; Sat,  9 Sep 2023 01:35:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qemse-00064q-Cj; Fri, 08 Sep 2023 21:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1qemsd-00064W-61
 for qemu-riscv@nongnu.org; Fri, 08 Sep 2023 21:35:23 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1qemsa-0003QO-H5
 for qemu-riscv@nongnu.org; Fri, 08 Sep 2023 21:35:22 -0400
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-502a25ab777so1372669e87.2
 for <qemu-riscv@nongnu.org>; Fri, 08 Sep 2023 18:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google; t=1694223318; x=1694828118; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/fyjxW2eLZx0V0NXeZGIjIYEqBhgVPGDa3d0QU5Q9ZM=;
 b=Q4OtAIxLPM4zHQFt980rm+AnuTfKZsPWt6LGwNaM+mfHPzZoXr8KLKKzFuwRY8Ol59
 6Y2+tWIjaupIJLIqX4k3T8hHsjOythVSzrpgeB8byQAI0bJ6qJMtceqhoxkYJ5A9Qjqk
 Mgqqeye43l17p8EpZ6SMCYwzItGsOFfmRhH3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694223318; x=1694828118;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/fyjxW2eLZx0V0NXeZGIjIYEqBhgVPGDa3d0QU5Q9ZM=;
 b=Jg3U6/97pf1mxDdT6p+84dH91nK5vxcbDtA7RvSSrmnm0IrRTs7cVhGthcpveu9rzN
 9/KHOr3dQ023gugjZsPdan7rgtIWivmHQ9KSRtDSzW2x0rw0rZu8tg5bSPgZQrBGjetY
 rXSDCzjOGA4XmHIqw3ZfuAAS8VqFMc/Q4E73bb+4/GSHh5j/BxuoYgGgrmKg2R/8HbUs
 A/frfLzLOPhlhQyMA9aqkkKniYilO4DPIbbL0RTQfrjFB8n5AZDhkK0L6AwcEcgbEUQT
 LMswTSt6yl2pqHFEk3jtltRxKk0NBPHSgia5j07khkO2JWyF6FfvHuPCEpMflbGrcnBA
 q/9A==
X-Gm-Message-State: AOJu0YyE+eLqohf0bhBlveymnb/6+wixCMeA7zvu328nDr8pR51k5uEO
 SnjXTyu3v9UES/sNkFOmhSUp7Z117fhGs+6wzTeS
X-Google-Smtp-Source: AGHT+IGWR5Hskrb8njW0iKdiK3ATHSCNQZMhPBZpwRawj2mT1Xyh6yU+40eMC912JtK66BryO9TL1rtIXE4PqVs4wLE=
X-Received: by 2002:a05:6512:3b89:b0:4fc:df79:3781 with SMTP id
 g9-20020a0565123b8900b004fcdf793781mr4464040lfv.66.1694223318391; Fri, 08 Sep
 2023 18:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230908033129.694-1-zhiwei._5Fliu@linux.alibaba.com>
 <20230908102912.535248-1-pbonzini@redhat.com>
In-Reply-To: <20230908102912.535248-1-pbonzini@redhat.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 8 Sep 2023 18:35:07 -0700
Message-ID: <CAOnJCUJexy3PhmGnGNgOk3a5LWLw6ZvFkwYRXTCErGnhn_A9uA@mail.gmail.com>
Subject: Re: [RESEND] qemu/timer: Add host ticks function for RISC-V
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, LIU Zhiwei <lzw194868@alibaba-inc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=atishp@atishpatra.org; helo=mail-lf1-x130.google.com
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

On Fri, Sep 8, 2023 at 3:29=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com> =
wrote:
>
> Queued, thanks.
>

I didn't realize it was already queued. Gmail threads failed me this time.
@Paolo Bonzini : Can you please drop this one as this will break as
soon as the host riscv system
has the latest kernel ? I have provided more details in the original thread=
.

https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01941.html

> Paolo
>
>


--=20
Regards,
Atish

