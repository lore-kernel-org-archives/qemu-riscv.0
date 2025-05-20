Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32342C3DA6D
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 May 2025 14:41:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uHO99-0005CF-9M; Tue, 20 May 2025 10:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHO95-0005BN-AD
 for qemu-riscv@nongnu.org; Tue, 20 May 2025 10:40:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHO92-0005ze-IB
 for qemu-riscv@nongnu.org; Tue, 20 May 2025 10:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747752038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=olzendEO1KVkWoJH7CUvhbzVaHfoPsboH03R7MrNBoE=;
 b=HnayHOYzfIYYYJP0tUU/VnvkKSg+5zpq5hJNLvj3XwFu2VadE3+omlfpRTdF831Mzg+ex5
 HOJ/OqjHBZcEU1bktPp9G4+Isg+mws7emIAX//n6Q9iBU8hVRNsutfB97qeuiEG5yNicY0
 JbR1soB7qbzJt7qY8AZiD8r3Jq4nKYs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-PORYYaocNRmGwiex8AIZpQ-1; Tue, 20 May 2025 10:40:37 -0400
X-MC-Unique: PORYYaocNRmGwiex8AIZpQ-1
X-Mimecast-MFC-AGG-ID: PORYYaocNRmGwiex8AIZpQ_1747752036
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a362dcc86fso1625500f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 20 May 2025 07:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747752036; x=1748356836;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=olzendEO1KVkWoJH7CUvhbzVaHfoPsboH03R7MrNBoE=;
 b=lL4prfpx9GDH2H5F4v0szc3O27OtAlufyU2uTLxR/tefKVBPrsbmVq9ZnBGEUXlD6h
 2mHNVcCkF1Ku2PzZHnk10aGnty5tui76XjAytiYtwANuvz3xMlzcYrEyCGa2dTz3wx/j
 s+qP6z4aiRQ/KCRMu6l6N9sJIYTbOP0a7wmuWwlaEAt7e6OPiO6C68m0M4wGgeYfat8N
 F7fdjr2rE+d3B58ZwQXU0CJWa6W8CTJR1ru7Dtxb2ANObLlqPPuc747uX6K62h8YyK8d
 xXo2FjDu1N4dzJZBe7QQuxwphAGSYQseggTN6c65QLYO6NzU3O6bX7/iUgvu4xN8N5a4
 Vdjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4lPhfShTSl5VozjULjekkzARi/GfvF3947Seb8tCtLYquvHvuvuD8Y1OC7PD/2Ycazvnyaj0ig49V@nongnu.org
X-Gm-Message-State: AOJu0YwVhZ85klvhwm66g8bOBoOfQrLXLYBayjR6I5Zv8WhpBRolHCtY
 l7n56yvtq6bWcA1rlH3UtYiUXsfZ9KsCsFK2MdB9y+T+EhFBnGu2HLVwTySr94vqn26mTDsJ7mB
 n8urDd49E930ep0OHPw9qzzopaEXwwr+HVg6xqwxJLz1EJhm4tq/O691dilkIbU8f7S65Ynmpfk
 l3OeCiYPouMrRGsYAPVrwr8/IdeeH++Ys=
X-Gm-Gg: ASbGncsBrmv5jsumxzO4MOYsh9mgHn5rE/PIRCKWAaaaN2hmlu+8+4PCDyEENn2P/DI
 WKnacEKhw3TRLVqGS18ei+9DVAx4ZHiEjgcSQaUnasLHvJx+adxEp0YYrOMWJQ1YIDlc=
X-Received: by 2002:a05:6000:2903:b0:3a3:6e62:d8e8 with SMTP id
 ffacd0b85a97d-3a36e62db92mr8106051f8f.55.1747752036511; 
 Tue, 20 May 2025 07:40:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrkn8HHCOglcv/wyO4kl0v0OKRkMVQ3N70QJQhen+oVYudjXrCMkQ7kjcpx/qXRlPotT++4PfMTA+Xmx0DiQk=
X-Received: by 2002:a05:6000:2903:b0:3a3:6e62:d8e8 with SMTP id
 ffacd0b85a97d-3a36e62db92mr8106023f8f.55.1747752036139; Tue, 20 May 2025
 07:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250516122319.4100121-1-alexghiti@rivosinc.com>
 <87y0usiz22.fsf@all.your.base.are.belong.to.us>
 <51356014-b645-4e86-b338-0d097bf80260@redhat.com>
 <1e170923-9bb3-4327-a6ff-75c53bb2830f@ventanamicro.com>
In-Reply-To: <1e170923-9bb3-4327-a6ff-75c53bb2830f@ventanamicro.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 20 May 2025 16:40:24 +0200
X-Gm-Features: AX0GCFsZmhMan_ntxExw6BkawFET-7UyCaIwPot1bxeIn0YAX5GjinuRCryd8QU
Message-ID: <CABgObfZR8NgEiFm9xuehhm4JU7y2W5HNbmdbQ5VOSGRifSdExw@mail.gmail.com>
Subject: Re: [PATCH RFC] target: riscv: Fix satp mode initialization based on
 profile
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GZ5l9oF9Q-qfnYn1V0ElB5cLqtCrmaHTACa2zJy20BU_1747752036
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.487,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, May 20, 2025 at 1:33=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
> > In general a lot (if not all) of the profile code should be moved out
> > of tcg-cpu.c and into riscv_cpu_class_base_init().  I didn't do that
> > because I didn't want to balloon an already-large series, but it's a
> > pretty obvious extension of the RISCVCPUDef concept to include all
> > profile features.
>
> Note that KVM RISC-V does not have the same profile support as TCG - I'm =
not
> sure if KVM RISC-V has RVA22 support, let alone RVA23. If we move the pro=
file
> logic to cpu.c we need to be careful with TCG assumptions affecting KVM C=
PUs.

Yes, but then that's even more of a reason to move code to cpu.c. It
means that "-cpu rva22s64 --enable-kvm" will print the appropriate
warning or errors.

Paolo


