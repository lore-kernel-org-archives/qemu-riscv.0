Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49612C5CFCF
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 15:56:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuuGd-0005zy-21; Fri, 14 Aug 2026 11:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wuuGX-0005yk-OL
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 11:56:19 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wuuGV-0007uT-Cx
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 11:56:17 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-81f64e8dfbcso17188467b3.2
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 08:56:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786722973; cv=none;
 d=google.com; s=arc-20260327;
 b=HSf76Oy2rRr1AOTRqDLZxX5gxFkDgfwqmHOm8yuq6K9OztNvCLW6KToNQSgwV+lF/T
 Wg/TnUHqk0z5aDhCvZvEtIaohO9j4C/oPKc6YVDrlC4uotJGOFb9adFHy+xKHC8MiM7k
 SHaY3ijh6RLW6JfnkGhKJQmoZegSFLL9zFgGnqh4vuRXcJouh6ZGoZ9y2kjqAK9iRDlQ
 r/YdRWRpJtxTDdigmhLCpcvWZWw+udo1VOfVHMODRIapnauBtNg72mSmpXaWux655uGK
 We7VSNgHQHeMd6pgBeQ0uxyAM6pVyT5+NRAhWAV62vTWlwKGbs7qSzRjSK0nl7CU2DaS
 l6Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=lg/Ruw0d+vajfGGcoV2/3L9GneOxOoZt7dCao/BHJHw=;
 fh=sVA0lzBxnUCY3ZYwv4BwrvYEGAA7V7qJsm0WEQqYaFk=;
 b=BM0hID4lTEEzy57hp9u85allcBrwKSzjjttqFYw9qnSrWSsA5TvkMOkDrMgL658dkB
 MsBBTrnjcJvNA1tLpaP08nSbAeGTceo4tr4lOoIvyhSDTctPYC+ngsWO+7JkZ4S2dpV1
 Wu62RWnRDH3pjOJ+woya+Yx679edZ/61bBUX9R94Wgtyc/zlTvxIhyLF2zmhSesViyjF
 6sKeUI0pj6LZ6b+2uR9zQvXppaBfd6xNQ9omgAqS1glZiJB0QkxwPy/6ZP5xA/cbmIi+
 wzvtQZcfnSs+FXOI4qr7C6OfYLd+P9wziTetCfCC6XBCjIloDjccGyjDDsaLHI6fKBUO
 PCAQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786722973; x=1787327773; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=lg/Ruw0d+vajfGGcoV2/3L9GneOxOoZt7dCao/BHJHw=;
 b=IhSrr/rXVmjPmxqJXcRiiMAoZ5fOCHh6J/7NNz4BEAjm50v2LGpyvIFw/APlYvDEgf
 CK2e9WY1B8mo0uT8I4gFBYZm+mPtMiHbZ9tnJLcPiXCgdsq++LBOxnZbfyf57dwpA8rp
 ICONxcBvNC+eDIM5KTmyTz5sXgdxrAVQRIcOG5HxPaiIMeKafJ6cwTcHEO1o20MBj47o
 eWXd/tGzKhK30vxGh82YmT4CsoZthkk6iVKt2L6/h0CD4bVf3vZAaE1hnZTb6NvopMus
 zzQ2TWF1MX3mPMZpe3bpSky72GyAo82wrkS0S+ZCZ1jCownMdrADMBf/hBnYA5Bq/3Li
 rdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786722973; x=1787327773;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=lg/Ruw0d+vajfGGcoV2/3L9GneOxOoZt7dCao/BHJHw=;
 b=Cspfn0lfbCivbEVKeWjxrhXY4HgV/OGYuDeEpOrLIRgqG3SqWW0/0cnx/P7MHloO7K
 4iMwGBO8/pUmCDKjoCv40yeLdYIayE231X6/BoMOQ7XO+4cDujrU/8+a5se/1zNB9fFq
 jgE9wVX83w/cInXgXEbD4zT/DBppzoh5TiDyjosWIJ6wLOTaW2PhHaCLhet40QeIzyyC
 3qDjs+Zf21yvSdXCSYOYxvbcHYHY5WuII6w76t0Ou79NxGKCKJe6t3UShsWXUFtqU7J4
 S/lhb3G1ZD4Q1/VEJOloQs1ikh5k7HUWPHnhSuMURkH/cz31S88DKoxdWVyqtOOt0syC
 4mDQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr0q4KDLxxkTqaXokd28uEn1QyVTFsH/Ca+LgxMDDHWf69Ox1P6yBuTbqL9SYK6ITRgiAtLYHfHi6Oz@nongnu.org
X-Gm-Message-State: AOJu0Yy6XmHJw0VXgFuRfTyY/IRoG3CciT1cjWljJ7ovMHmpjx5vh3AA
 pg9wl25MqKuBYD7crAad3A2viwZeXLrw0eAOBy/6wRJoSSWvo9mkR4UTXtDs+PaBWov3WvnL4sZ
 iGqvAl/Z2L0KYTyJ3MxQVKTYqrA0Qpwg=
X-Gm-Gg: AR+sD114Y9+om4Y1Gqk3HR/eoZO2NXk78KR4XbOUo+yzKKt9lqDa/za6CH+hCNzR6Iq
 7J/DPPDXCLfFr5Z9Y8PzJ47sT5RCnWi8Nkk8bCbMzPc9cGcqkMQJJb0qzKR+0tFf7cp2PWoYg5+
 kAwVvq2tYS9fCjAZqQk+uSp21aSrYIjUiFNXNWTXRqLjYmRWvj4wacb/hYbi5NU8qzAQ1l+pz7e
 3nmdSYe2SPoxDufCcnEjUNF7SJSV/TzLpBtX+woZTplf8/+L+I5mRSIibZgIp/y2daStqAsO6Mb
 U2x+JVNz8YrwMd7QIC6SQMjUmU5/cPW36RqPzZjrfqE=
X-Received: by 2002:a05:690c:6d0c:b0:833:4ca4:f3d7 with SMTP id
 00721157ae682-83712ac3230mr30350617b3.29.1786722972878; Fri, 14 Aug 2026
 08:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260813135717.2758-1-flamboyant.h.01@gmail.com>
 <20260813135717.2758-2-flamboyant.h.01@gmail.com>
 <CAAW0U4ZRqfcNmWi8davsvu-zVFmq4fJgbjjESb+_As3vPnu7jQ@mail.gmail.com>
 <8004347514ec6b8f002d9f47189e97e17f42429f.camel@alistair23.me>
In-Reply-To: <8004347514ec6b8f002d9f47189e97e17f42429f.camel@alistair23.me>
From: Kangjie Huang <flamboyant.h.01@gmail.com>
Date: Fri, 14 Aug 2026 23:56:02 +0800
X-Gm-Features: AUfX_myZ85ngJjToDWUQY44UqWowNSyVMGhLE_vyQ__SCIym_1G36opZ7K_lmQI
Message-ID: <CAAW0U4agOaAedrTnPzswdpJToNED=gjcWV4KZ883shgn0HoT7Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] hw/misc/k230_iomux: add Kendryte K230 IOMUX model
To: Alistair <alistair@alistair23.me>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Chao Liu <chao.liu@processmission.com>, Junze Cao <caojunze424@gmail.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Kangjie Huang <flamboyant.h.01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=flamboyant.h.01@gmail.com; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Alistair <alistair@alistair23.me> =E4=BA=8E2026=E5=B9=B48=E6=9C=8814=E6=97=
=A5=E5=91=A8=E4=BA=94 23:09=E5=86=99=E9=81=93=EF=BC=9A

>
> Please don't add Suggested-by tags just for review comments. Generally
> you would only add Suggested-by for new patches where the idea was
> largely contributed by someone
  Hi Alistair,

  I Understood, Thank you very much. I will not add Suggested-by tags
  based only on review comments.

  Best regards,
  Kangjie

