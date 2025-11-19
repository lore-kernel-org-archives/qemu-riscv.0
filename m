Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3A5CF58C5
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 18:05:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vLmYQ-0008PY-Ji; Wed, 19 Nov 2025 13:05:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vLmYL-0008ON-Cq
 for qemu-riscv@nongnu.org; Wed, 19 Nov 2025 13:05:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vLmYI-0002YA-Le
 for qemu-riscv@nongnu.org; Wed, 19 Nov 2025 13:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763575507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sLup+W7pa6WZ/k6QZNaZVOA124clRvPAt6nyoZoANYk=;
 b=O4Lxjj8FbVBqJT7CeLGsHM7udEY7HQj7VIKzCTOX4HvhP8b3jUzHKToljoKO5vSEkEJzA0
 JMJo8R8M3wXKmXoKEbfRlxY9Eo7k/h37Bk/RvOjdhmeRmDFKD24SPFGOT3YDYDNVPoLk0P
 EPCiMzbRFBKlbGch/aLqRTddlxo9bSw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-e66JiDYcOW-CT7CtAPZJEQ-1; Wed, 19 Nov 2025 13:05:05 -0500
X-MC-Unique: e66JiDYcOW-CT7CtAPZJEQ-1
X-Mimecast-MFC-AGG-ID: e66JiDYcOW-CT7CtAPZJEQ_1763575505
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8826a2b2d9aso578476d6.1
 for <qemu-riscv@nongnu.org>; Wed, 19 Nov 2025 10:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763575505; x=1764180305;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sLup+W7pa6WZ/k6QZNaZVOA124clRvPAt6nyoZoANYk=;
 b=ok4904VRN0QJKRo6NCB3EA+MVkBK5FlOl54DB4CbGFeG0N/2jyjJ1cRvwmU4sRPf5Y
 pLn27J1+T1fNuJ/7eaesZbhgCW15FTdKtjH7YNAmdTCd6voTfHEk9ttzpjMTVx/M4LiO
 YTz0unhYSp0c9JXBWLPtxaAeptVob0RVEOPA7aFPv2lrRnfrkdCojWCNQKnWojsA8A0e
 4xljJh2wKn1FQ/dFAOz/YjSm5XcgIysuTfecpk6SiKY8YjWi8vbweMEG+145d1j4EMXl
 f5Obyu5cfmrZKLhy66FOqfGgGX9t7j3+N+6/SGyzoOtZ+v+Mi9+FNu+WdE7IHFZicVt8
 24lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvRYYc42wAT7n/hlLFhaXqDeR6Gnuknr7ouCYjpcEj6q+vjrlZz+QLmg+Oq/Ei8MaqXfSQFm+b1p9r@nongnu.org
X-Gm-Message-State: AOJu0YxBl1y2+mJq5e5K59Hk0KXX/q/tfooM4axrmttNFE0DwT39Ch5x
 m69FOg0hdW9RM2QWE0E3uzWJv09SuuNEFUa4wNLW8hWQir5u1/0gCNDvi+T6EWnamHwxgwYxSr4
 Ae+uT1B1r7vf1ggLtCVSkub+FvHVlIO5jE1FcuZmvUVSatUYIPrmKU+U8
X-Gm-Gg: ASbGncvI7kiCGrCnPAjASmu4o2QrParfwgRVcmqV/7shWn/69gvp42QW4a+w+LAC4j0
 NlYtgWIO7h/F6iO+zmhCIVCfLgp/sNSHbJ6ZpY6/x7gTaNLWXdEnXvp9qtqNwEllmp1isuAfbe3
 oYVScYXZIBu0wSXueKVEK1Jk9aylfYRPBmQnkmxQFz25guRjPE8pkI6gBEOgtyufOVVWzoN4SZB
 EXbay7xx+5E50d5SrKSOFIFfBDUrB66KdtZ4I8af13Vy0HqY1OtySIO4WhOZiT32lYOkXucHNZm
 wS2p2OkVtkQi/RqaKQrY8o4GdndkVqQ06R9TUNUZUbiASri0EDJSJi1iRnwmHRUOaOTYiucfOhu
 cffc=
X-Received: by 2002:a05:622a:1915:b0:4ed:8fa:6fc4 with SMTP id
 d75a77b69052e-4ee4971d531mr1624991cf.78.1763575505145; 
 Wed, 19 Nov 2025 10:05:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyg2JyzSrFhB2LMApC4ECHgD7juQRduC9UIz0/PCIU7u2oBKhMX1CSoSw3khRb1Qff2CShKQ==
X-Received: by 2002:a05:622a:1915:b0:4ed:8fa:6fc4 with SMTP id
 d75a77b69052e-4ee4971d531mr1616981cf.78.1763575499123; 
 Wed, 19 Nov 2025 10:04:59 -0800 (PST)
Received: from x1.local ([142.188.210.156]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88286595ea2sm138610226d6.51.2025.11.19.10.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 10:04:58 -0800 (PST)
Date: Wed, 19 Nov 2025 13:04:56 -0500
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 alistair@alistair23.me, edgar.iglesias@gmail.com, npiggin@gmail.com,
 harshpb@linux.ibm.com, palmer@dabbelt.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 berrange@redhat.com, farosas@suse.de, eblake@redhat.com,
 vsementsov@yandex-team.ru, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, zhao1.liu@intel.com, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 4/5] error: error_free(NULL) is safe, drop unnecessary
 conditionals
Message-ID: <aR4GyA3nfvelqr7i@x1.local>
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-5-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20251119130855.105479-5-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TUSn_Vi_EIhGDuMPWBtUCO8Y17-6QKgb1no2oMG7Ig4_1763575505
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Nov 19, 2025 at 02:08:54PM +0100, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


