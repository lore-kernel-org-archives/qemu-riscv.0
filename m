Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65E9C5DF7E
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 10:31:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wwH5b-0001UG-KM; Tue, 18 Aug 2026 06:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wwH5a-0001Tf-DP
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2026 06:30:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wwH5Z-0006f4-1U
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2026 06:30:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787049036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6FufrT6QF5LjGVnfECdhMWiAuksb5oHrBpr4wzMjdAs=;
 b=hdO+vOuD9e64LB7fNrj+Wr+xYRwIjtb4FBFniR7GPQfRQsL16kpGJRIgW18T6s2o6t41Uo
 ffoR/DaJ3xElmuEqqoCa3reI8BN+5mz91DEclB0OCitiOlCfCmn9mop1mNe/N4QR4+tgKF
 6sY5hJcWN8RZw1H7gNepC8L3rCRna9s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-WAk8IgQzP3uqMKi9uA95kw-1; Tue, 18 Aug 2026 06:30:30 -0400
X-MC-Unique: WAk8IgQzP3uqMKi9uA95kw-1
X-Mimecast-MFC-AGG-ID: WAk8IgQzP3uqMKi9uA95kw_1787049029
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-482a2d55c4eso1215409f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 18 Aug 2026 03:30:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787049029; x=1787653829;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6FufrT6QF5LjGVnfECdhMWiAuksb5oHrBpr4wzMjdAs=;
 b=YcfYdiCxZzI7HaPfy5okBjXdNYhXsiSgtdeeg92wkLO2zsLSlFf3sVlu414EP/jKX1
 zGqcM2RGm4poid653XcFbMr6ibec7HpIbqZHFsiI0qYaWmk7yl/WCnuum3WDzWgafPTw
 C6EcW600VVqXj3VPD71ukOJBIFKj5nedyIjzmseucwHuMTQbaHw4XSRdFM3ZMbtFZic9
 gJyfNkgCk7u30r91eTj4H1iKICRfOTFUqIK/KKOh7ayJnXSpDXpWwlChZd4To4wm8aGx
 3N6oPAZZlrRmdng4EybeIZ9L6YZjZC5MScl1BFT1mOXvq0EZWmclDTc5u8uDjHZLjd3q
 VQBw==
X-Forwarded-Encrypted: i=1;
 AHgh+RohQpHPnNvd7NVUCc+VH1w9UjNIJ9ikItTsx6pDg71FTLTuLY9/NtWK4m1BT4MC9JQEHK3ryPoGgJlS@nongnu.org
X-Gm-Message-State: AOJu0Yz5+y+G8NMXG6TtBq8MMd15eeL3/TJGcAk+HgTboYIxhQOC5w8/
 Xes7WlDkPW1yueqrkuf63yIiSED8APiivilSNZoUT8VXuN5F/Bt1KOYAPwNt+9VgU9SAk9jI4/Y
 9eZ8p5S4pMPq47GII4wzbVAVeWbk9Ya2f0TV3QEwh5MJ8mSWaziA3BHr8s0up/s/Yqkx5icbXAg
 IN3AswR60pWeGvIF8xd0BTCshWqhLKEB8=
X-Gm-Gg: AR+sD12eAygifn6CA7BynkyK2QMMMYRabq9HbGzxC5X9MWCcTPyKVUiDgcg7gT7i9FV
 I2Utld7q5bZkgIUq7j7T1VJuxNO/L96GZBoA4sBegHvsou/Pe6ylrDRPBgOlw0cmnr9kQIBfc0l
 sz3VucZM0dAziPDx6znkxii9FDWEx7wmFADQc2hfPwt6hlRvfSrxpN6CugW24HEs6g3RAuCF1PT
 OZrCLg5AYU3u6lvDNrvtEP4Lb3PvsQ48+5MgjKKG2J4i/jIUsZ0CnjmHVo=
X-Received: by 2002:a05:6000:2891:b0:482:a909:53d3 with SMTP id
 ffacd0b85a97d-482a90953f4mr11113070f8f.2.1787049028815; 
 Tue, 18 Aug 2026 03:30:28 -0700 (PDT)
X-Received: by 2002:a05:6000:2891:b0:482:a909:53d3 with SMTP id
 ffacd0b85a97d-482a90953f4mr11112989f8f.2.1787049028385; Tue, 18 Aug 2026
 03:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
 <20260813181640.6537-12-philmd@oss.qualcomm.com>
 <55cc8357-daeb-4315-9f3a-8be7a59c355b@redhat.com>
 <3ec603ff-65bb-440b-8ed8-72ae4e6c5a41@oss.qualcomm.com>
In-Reply-To: <3ec603ff-65bb-440b-8ed8-72ae4e6c5a41@oss.qualcomm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 18 Aug 2026 12:30:16 +0200
X-Gm-Features: AcwNN1U9FkNWmAq29kJzhpwyumQVJaYATOb2EskO-A53Cr-akB0nGwo0bt8h3t0
Message-ID: <CABgObfaDAhrpnVqQaKgG6uxPQe1YDu77YOsUEx9nqrN=3M2cGw@mail.gmail.com>
Subject: Re: [PATCH 11/16] accel/kvm: Consistently return CPU halt state from
 process_async_events
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Mohamed Mediouni <mohamed@unpredictable.fr>, Alexander Graf <agraf@csgraf.de>,
 qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, kvm@vger.kernel.org, qemu-arm@nongnu.org, 
 Magnus Kulke <magnuskulke@linux.microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iyRDwcvXiJJbRJr2P7L0mdtd61sLZfGLI-pzonYdejs_1787049029
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.343,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
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

On Tue, Aug 18, 2026 at 11:24=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
> > Your patch is correct because, even if cpu_thread_is_idle() sees cpu-
> >  >halted =3D=3D false, the flag could become true during
> > process_queued_cpu_work() because it releases the BQL.
> >
> > However, I think the better fix is to remove the return code, and check
> > cpu->halted in kvm_cpu_exec().
>
> Looking at it, even better would be to move *process_async_events()
> from inner loop to outer loop for all accelerators. For HW accels it
> seems quite trivial; for TCG I need to figure if it is safe to call
> icount_prepare_for_run() with the BQL taken, due to the replay_mutex
> uses -- here the win is cpu_handle_halt() ends restricted to system
> and we can remove the odd EXCP_HLT handling in user emulation.

Makes sense, but probably it would be a series of its own. :)

Paolo


