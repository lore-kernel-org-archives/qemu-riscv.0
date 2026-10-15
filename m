Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5DCCC6B33
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 09:41:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHHxm-0005eQ-Pv; Thu, 15 Oct 2026 05:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xHHxl-0005dz-Hz
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 05:41:25 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xHHxj-0006wU-EA
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 05:41:25 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6a0a4aa99bdso6407899a12.1
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 02:41:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792057282; cv=none;
 d=google.com; s=arc-20260327;
 b=MMOFxcfjgowaKjjTXEPLi726RrTPyYiRqVSHrlhv0I57Rn2hNoowaqYXGxmer96JQP
 f8aqtdnpe79YtmoDCikroiCqlo+V/yGf/dti4oMZFp08oKr6khulGYNiTbF0q4csbIDI
 LFdEJkns+Vb+GDyYEmzpvLGOjVRyIyGYHfhqjAumWw1V4IaiUzGVfXB250ZcJZkfxQME
 FZFTUcFSuCnQwhwkuutrIr6HGcTQqZNjwLcGV9lNIWIkK+vTHiqh8FIe/hJNzkgfb246
 2zV4j7SrHnEA3JigwRdcEMQkDHzfih09InAtMoCi5H6KwanK/kaqJ6P82hbWwX7V74G9
 uLEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=T0uNFZETbrUrkESV3u2WXEkKMGRLrPXNrI21GDl35/I=;
 fh=TiQo043ailk6meF1KbnwIQIWX61577WQDsgeXDI4GTg=;
 b=r9Q68p19pGQYfu3iRdQn+ezakkYBD4if7SZmJxU1ES5JSWux0svD97EzmzAtIn4bqg
 HwO4LPCx+Ls5K4mixGF/h0pW94JpJSaqYjWQ8f67MVcTO8+3MlB/7uVh9ZGyRtfRaJqf
 /xfV0MFkun/XQSTrqu0nU57/eCLNByZhfCvDgfq84r6HqVvrhsSsDTuFJfpkGn5hGZZS
 /SHRgicOk5p/zF++EYffIbCHJLBx4t53vofQyel7oK7qy5y49yePf0u8MvzgcXGCpAty
 Fnb0q+FsQJ3w02PNrHo6M5Z/OIA4gV/X/b8v7sHRaZ/ZLr5oMBmgHSt2q8CsDZ0EwVz/
 KadA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792057282; x=1792662082; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=T0uNFZETbrUrkESV3u2WXEkKMGRLrPXNrI21GDl35/I=;
 b=oQgrtxsbc5GBLlm1Ykh5ado6R13Tvwv2EeEo5C10ht+Uhrvz92KvGugqvnbv8HZ5gc
 iliXokoTYPpMJuJRStk+PCbZ0n8t5+Ka7FenF04n6c6w+pYVu3GLQmoTJasMCQRYcTxk
 o1CCGGHj9QQUoPR8y2uWXwz7FgIKziCvupGeiBs0hMNOM61eQYOvT225Rxlxs0OQNfGt
 PA43TrvqBVpuLcCCU00L+ib0U7oXt1YMnM5GBtaSPL1HV0HAfZvRwTmrKWol3wUIscDz
 IpZ71duLs5Nbr3gqrr/VBPU0oPsKuK25gXpPn0sbbbVaJnhyxyr/l+nbp5ARbTNuyA5T
 FSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792057282; x=1792662082;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=T0uNFZETbrUrkESV3u2WXEkKMGRLrPXNrI21GDl35/I=;
 b=zngn0rL8DgZUsF+nMK8e6dP4qb44jvdt3BrwLZ4/Dd0AhSlu2OjwW4X20g2LAOTgnp
 ld8ALLKDzKuCnkeiYbvZaN598Nj4OT2fa8Cj/cLO65pcyTkxtmyfO9Tc208iaiFJXqbt
 sAxcmRE5Loz3pWLHtD5hYwYZVOvVOSTNQZ5aRrtUCzC+YL5At8ECot53NDcDmKPbo5Ay
 24UlUhIzDZfb999kRmWupUVoo87eaPmYP6S2x8e3kQJzHNnemOSBlZahlwQ1mHU9g61j
 DDgXCXPHf89mrAHxkHoe5nIoRpW8sCg/xdqTEfc8fHIw3sWhctp3RrCJ5qmoQ0KhIgGy
 DbaA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzQm7MQyEMNPOpxoIIVFp3GRI4kSW6r1GqQ4f0PvoBI2TsZFUcR3O+KboNzIN2Phak1ZUEtrKJrGjpz@nongnu.org
X-Gm-Message-State: AFq9FYLz9VKpWjmWjRKQvJUJMLcuYHxUfvi0IVQb/dJ0/bZtotTOWaEE
 WGusA0R1NB+a6jiHMTfyVkD3s4I3OBwdu0QhWZl/98jpSR/92R1M58zknthSjEnrWO/b1GyAAoM
 zkZ+QAwL/4fRLLxy3HBupkOuwc0lp1r0=
X-Gm-Gg: AYBFou24/HUcCf7/8noUeQM7/2nPOVopReS6sC0jb2Ww/D5O79d8mGon4+kngKHvD8q
 ZqGX6JjhOhIp62uqQ+4c8zn6cOPqmEvJZNJEuzFLtR/pPTxal817rPFfrewa/AFNGOc72E98p9F
 IYK64NDF1Y7Nr1HuOTpB4MJ78Ci0CHQ+EYWXsITARvA08DRGlNsQPbKeSNgzb0sO3KHpA0HGkju
 bdSzVVubHsM3ogH8kP7JsiakdzOXNhQw5xfMAEp3ogxrM3698oo9nHhDmz+Pl5iM6gFxkeZNdkO
 6DKws1pG3DKfX4YsOMdp8kZFO9ZC/74gVnK3udcrdVmK3QowrOAQOyY=
X-Received: by 2002:a05:6402:44cf:b0:6b1:c7d9:b622 with SMTP id
 4fb4d7f45d1cf-6b1c7d9b9c0mr7663893a12.26.1792057281361; Thu, 15 Oct 2026
 02:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <20261015044104.879-1-luoyonggang@gmail.com>
 <atCc0GPHiZo2WlNM@redhat.com>
In-Reply-To: <atCc0GPHiZo2WlNM@redhat.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Thu, 15 Oct 2026 17:41:09 +0800
X-Gm-Features: AclHuK8GYGbA3cAAtuTRoMtEpjaxjCZh2tLZUcHwEvNTtJEr9Kx9Nv2nZyoQY1Q
Message-ID: <CAE2XoE8ONwY388OqaOBh65RvLr3Gsksk3QS3Cw2HFqH=bHE4-A@mail.gmail.com>
Subject: Re: [PATCH] target-info: dispatch CPU QMP, dump, monitor,
 and Angel semihosting
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org, 
 David Hildenbrand <david@kernel.org>, Glenn Miles <milesg@linux.ibm.com>,
 Zhao Liu <zhao1.liu@intel.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Cornelia Huck <cohuck@redhat.com>, Weiwei Li <liwei1518@gmail.com>, 
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Bibo Mao <maobibo@loongson.cn>, Artyom Tarasenko <atar4qemu@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Song Gao <17746591750@163.com>, 
 Chinmay Rath <rathc@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Brian Cain <brian.cain@oss.qualcomm.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>, Xianglai Li <lixianglai@loongson.cn>,
 Chao Liu <chao.liu@processmission.com>, qemu-s390x@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Oct 15, 2026 at 5:29=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Thu, Oct 15, 2026 at 12:41:02PM +0800, Yonggang Luo wrote:
> > Put query-cpu-definitions, dump notes, monitor, and Angel semihosting o=
n
> > TargetOps[SYS_EMU_TARGET__MAX] and look up by target_arch().
> > Keep the table in target-ops.c and with a stub
> >
> > - Register with a QEMU_ARCH_* bitmask so shared base-arch objects
> >   can fill both slots (e.g. QEMU_ARCH_ARM is ARM|AARCH64).
> > - TARGET_INFO_CPU_OP is type_init. A NULL member means no handler.
> > - Drop stubs/qmp-cpu.c
> >        stubs/hmp-cmd-info_tlb.c
> >        stubs/hmp-cmd-info_mem.c
> >        stubs/dump.c
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > +typedef struct TargetOps {
> > +    void (*info_tlb)(MonitorHMP *hmp, const QDict *qdict);
> > +    void (*info_mem)(MonitorHMP *hmp, const QDict *qdict);
> > +    CpuDefinitionInfoList *(*query_cpu_definitions)(Error **errp);
> > +    CpuModelExpansionInfo *(*query_cpu_model_expansion)(
> > +        CpuModelExpansionType type, CpuModelInfo *model, Error **errp)=
;
> > +    int (*get_dump_info)(ArchDumpInfo *info,
> > +                         const struct GuestPhysBlockList *guest_phys_b=
locks);
> > +    ssize_t (*get_note_size)(int class, int machine, int nr_cpus);
> > +    const CPUSemihostingOps *semihosting;
> > +} TargetOps;
>
> IMHO, TargetOps shouldn't exist and this kind of thing should
> be done as virtual methods aginst the CPUClass, or failing
> that, against the MachineClass.

Good point, so > +    void (*info_tlb)(MonitorHMP *hmp, const QDict *qdict)=
;
> +    void (*info_mem)(MonitorHMP *hmp, const QDict *qdict); should on Mac=
hineClass?
make sense. just for x86 we need a base abstract machine for it.

anyway this is intent to be dropped. just for discussion to receive
some feedback.

>
>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

