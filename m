Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1A0C369CB
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 18:07:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u7eUb-0000X9-FS; Wed, 23 Apr 2025 14:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1u7eUZ-0000WO-IX
 for qemu-riscv@nongnu.org; Wed, 23 Apr 2025 14:06:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1u7eUX-0005wZ-IK
 for qemu-riscv@nongnu.org; Wed, 23 Apr 2025 14:06:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745431594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=myCDdcqniXC3srlIWAAe0gy7O8yWyWlg+CPTXt6oQUI=;
 b=hAiNWOiLKF1mN5eP6QYjioJFX5/riI/bkhRkO9vqwVTvUD1M8bEv7HHnJ9gPQ5h/rSMLtA
 ORHan5DRGEJ5t7G3NG9Y6scQQFPFn4reaOjbtJkgZod6C7xj82p5Gk0s3f6Mx+BYnBh52F
 jCwiysG9EKqOjIdK0cP/EqU5UsFNswo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-TbryBqbuMMS39OpOeXr2dw-1; Wed, 23 Apr 2025 14:06:33 -0400
X-MC-Unique: TbryBqbuMMS39OpOeXr2dw-1
X-Mimecast-MFC-AGG-ID: TbryBqbuMMS39OpOeXr2dw_1745431593
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-476623ba226so2060441cf.0
 for <qemu-riscv@nongnu.org>; Wed, 23 Apr 2025 11:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745431593; x=1746036393;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=myCDdcqniXC3srlIWAAe0gy7O8yWyWlg+CPTXt6oQUI=;
 b=VxDA4bVJRvUbHEs8iCXKi3ami823YOr/sV14k9VYTkvSn6hv4mGSOQcY6ONAitoshL
 6yrEqhZE1np40KAsZMabT8t8sZH+vlkfm5cWt3r+eQtoLmdLt1MgFQZ+qrKbmYSB1piS
 W4+memsPl1LacyBkrTZagWrvCMSU655NQ+SOa2gMzmhxJBFLN+VxeB9eFqwRZK5RI65X
 aqK89wasCWZ9rZRN7ecEkMiLsPWIbhOx9mLiLEzgaI1G4qA1oiS39dmz2JXnuZBZSkTD
 OdGDtlHBBwqm3yXsn+Mvg9BON9RUHtXI4ZXZuJGE3iJ+TrvKXjPWD2M434e1HZcOTvCO
 zEdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgic9sKZaABabKZz08D6e5vgADMbYYVvFKUUjaEIzt2I0MD6a9dClVSv6bZdHIqbKlcm2GYpP6q4Yt@nongnu.org
X-Gm-Message-State: AOJu0YwefzuwNlZrBjeryqln66hdsj7XD+okBVdoHG7uybxGCFaE48T0
 bKylp+nCQPRtOagD5HuVfUPi9BAfoIOyuBxowhvt1hreOht+3hyN4Jf9sTvAs6Ga8Rnc5R+Lq35
 bn3pj8T5cY2FFNjHDI+PSdrt2gR2gGzcYg+FDlTmhXLeVXQ8/40+UQm3Cn9EXwZ3AKbtaQrkjIc
 q4hUx77a2vBAodWoPXaPfDe1IlVcQ=
X-Gm-Gg: ASbGncuzSWsa7NkWNQVmO75nQI3p5cuz9Nv2oROt/j1A8kDmGosQZk9na2wkj6PD+qe
 rQTrcQYUt88ajEMGeXbzhMgZ3l64qq69dR30eNT09kyxkVR7DXgJwr90CQXMbFmt+DsLO8w==
X-Received: by 2002:ac8:7e89:0:b0:476:91a5:c832 with SMTP id
 d75a77b69052e-47e77ca9fbbmr2526331cf.32.1745431592866; 
 Wed, 23 Apr 2025 11:06:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYArIOfVgc3Ow8oA3HkIQHw262mp5pDAZw1DnyCRp2OIl7CK5M1FNAu14g7sb7KJA7bIDcC+caiD2UW+lY0Q4=
X-Received: by 2002:ac8:7e89:0:b0:476:91a5:c832 with SMTP id
 d75a77b69052e-47e77ca9fbbmr2525891cf.32.1745431592434; Wed, 23 Apr 2025
 11:06:32 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Apr 2025 14:06:31 -0400
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Apr 2025 14:06:31 -0400
From: Andrea Bolognani <abologna@redhat.com>
References: <20250417124839.1870494-1-dbarboza@ventanamicro.com>
 <20250417124839.1870494-8-dbarboza@ventanamicro.com>
 <20250423-7d7e348ed0ec6cadb1efe399@orel>
MIME-Version: 1.0
In-Reply-To: <20250423-7d7e348ed0ec6cadb1efe399@orel>
Date: Wed, 23 Apr 2025 14:06:31 -0400
X-Gm-Features: ATxdqUHC7WKWWSAaVnA1qrTj3VbEi455gE6LUEJ1xhAg_l3NTVRokwwmjiDaZUA
Message-ID: <CABJz62NKOzO=aE-fz9Ad2gxLnSNvU41xnfhOS0EKLim0SnYOtA@mail.gmail.com>
Subject: Re: [PATCH 7/7] target/riscv/kvm: reset 'scounteren' with host val
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: D-XUUL-d1wJMW2T-AZzXw7YKO66ILxHxn9oJXI6fSwk_1745431593
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.294,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Apr 23, 2025 at 05:46:16PM +0200, Andrew Jones wrote:
> I would just drop this patch and make the default 'virt' cpu type 'max',
> then nobody will hit the issue.

FWIW virt-manager has recently started doing just that:

  https://github.com/virt-manager/virt-manager/pull/784

-- 
Andrea Bolognani / Red Hat / Virtualization


