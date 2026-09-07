Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B998C79F99
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 10:30:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3Wbk-0003Xp-N5; Mon, 07 Sep 2026 06:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3Wbi-0003XG-Fk
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 06:29:47 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3Wbg-0002ly-OI
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 06:29:46 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-870502743a4so14448227b3.3
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 03:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788776982; cv=none;
 d=google.com; s=arc-20260327;
 b=bQH43GcJZ6Mmyh6x5/EWbcaxL61oNZioWzImIoNlNO7a1G5ZAx7ouVsS7u4zzF6Lcz
 srd+mxT8vlm9ik9zkf6E6NPBSgIaEGSLuL0g0E3Eu5Jvepas3O0T7mCI2pHD7qTDW1G+
 V+6zhDbPjWQc2ssQFw8ciqdgEgr7BEYRdvBGrndHZ1QS9EM8+xsThvwRzimjBUAEROUS
 d8mokaL2NRNmTbON6bY0uUH1jORBRoD8SsDF06WXioDTi8pQODzSXBUqzJRKTKtgT8cK
 I2oYhHJlKQWQQoXQ0gJCgW2U3ZUOL4IfbBX0/RuzZnVKigi6jcqvcqCnkqUOz8HtNf+N
 abKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=kpovk2wDR4cuq4dslsWniRlZuj3byLtaKoc1QMTNeK0=;
 fh=LG87rR+Gh7MS8EaqCcCESWNh+ROuv7ULgE/gmFn62hE=;
 b=JlVXKnKjdtmcGmD0Gz1XZWFcgrQTtuPDj+POzlglFUkqO5PZd3IXNZomZ/lDiehr0V
 S/cwec46xRmenaeDWZj8OXR8DOL4UNOCqHL9uDeotNmC7dezpbXqF2y2T5aVXDxlDXs7
 t1xj7JETNdLxAQKrG/BFikQUDoqYdJH00HpsEp6oz1Ze4E+NF7pxySsZmyTJo8qwNR/7
 Vl+Ol/jZaD/Z0cbDtwC+hC1jyilWmvUrXdU3nlG/CwgAAIEYVSVa6KxZip7m87Pf7cOn
 My0SaMX6wLVfog1wekeJEKjRbMy0kuCzLYqtH6cu3ZcDW476ZhA61pRzyy4QC45eP25X
 MMRQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788776982; x=1789381782; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kpovk2wDR4cuq4dslsWniRlZuj3byLtaKoc1QMTNeK0=;
 b=zTm2jEU6FSPkcQEiirDPLXYyxmgmLtol6N7turF3bCfJIqFTrFwokzjGw4bIZrjxH0
 K4O0d/NxqJaY/VgE9B0EFOkoCqiYHCjOGFLg0w1qaZxIy5qjH4r04vTt9DzkWqDbKLqS
 pqpo+XDgbeAgg23g1ZX8mIvnjl8LkCTLYU/nnvGUTcWrxqpKBlk5l7SGUbKY4E7WJw+6
 pACYXV2qHONxdd928w/r5Q0N3fa1v89d6sAioa/IQ3FEytzh9pLcAuIfAsT+TBR3x3dS
 cZS2Gm2WcxSjSSArEPRNvPzqKQqdOQVik/TN6E+rTfmnW5YYsKydklsxcQohr9Fp+iG5
 f3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788776982; x=1789381782;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kpovk2wDR4cuq4dslsWniRlZuj3byLtaKoc1QMTNeK0=;
 b=VKklUu2zWUTlrfVZmnsvp1O8tbAnPFa8jF9iKiIkjTjzh29fzVeFkp061uOi6Sg0+e
 Rs+LRGjnZ+REVKKGTJohR0QJC3TKSxyBovZFp3sMNLu1gKCl1Y8kH3MqFBCVrXfAzFrs
 B6puQH+zaaPgFS3ym+hSlg2P7RZ2vXclUKInEeR9Z5gWCLYsc2qNUvffk9WF66IwdeZb
 41Rz/rY2SS7SXb749bNn3yqT0pZnjdZh77Tl7hsqv4NtlBN9YRpwbEtgkTWeLkMEkMoq
 Fr+YTaG7qOTbsofEWo67vp6xvdLmkool5OaHGUhQmmodlFertjF+f6hTXLEBukSvg2Iz
 HFUg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxkhKeT5C2XCm9XrQ1GudnUG1O25Ta/WtKCx1fiq3ROpg3EB7IUA2yvCF5apE0dWBZm8bMSr+ZAQxyk@nongnu.org
X-Gm-Message-State: AFuF++mgtYC8Yrc5eU4s3kHiUQ1vd4UpsIfB9nbtJArsXhyrfAwzSz9P
 PWd0HmjSujiQtOYLbvSlkNSfPXrqycCfhYwO6bvS9q3O4tf8ilYE7iWaZgUHCfNFA88d9uB3hHM
 R0Nr+/IpEMEm56I++2NZEZK1X6vDeJhepSfR8h1if6w==
X-Gm-Gg: AYBFou3oM01vkmInzqNFvp61clEWVs/0WIKulJl+WA11p5NC+SL9z7yfQdI6ue0bnyW
 9eVaYKJcnnNJ5O8nYreyYBGht/r34MZtcJbXTrRK7Rg1KGJco3s38Rm6K4Tx9/0fGJDyCZ6CMPv
 P3d81vGjRfcoECJDqC2jZPb9b+bzbkadtFlZCHXJtmlWubn6zy926CsCV1sKECerUxctD83O0gC
 +H/fRgUf3xOw71zxztceqxIDJ8HghtQ4nlcifVOKU1E+Dw9LsBsbx9BG4cAF1PT2JAcs4Se0sU4
 SLFq9HnZwsEgwxyQcT/PqCjKdOKk5CViKXLrUFeUHED99C3VVrpoEdScnue7MQl3GjPfGReUbuS
 MZk0m1eb2PNH3bbkeKimhYOFUSOSU
X-Received: by 2002:a05:690c:e3ec:b0:873:5bd1:98b5 with SMTP id
 00721157ae682-8735bd19ff0mr53492707b3.39.1788776982490; Mon, 07 Sep 2026
 03:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260821100856.1794011-1-xiangwencheng@lanxincomputing.com>
 <CAFEAcA_kLpaz0UQi3Q315kLVqvDtxKh77kU2meN9G1_evfKBeQ@mail.gmail.com>
 <bad5c8b3-668f-4893-974f-9dbca8dc6893@linaro.org>
 <02da9676-febf-4389-b09b-5e5d41c1084e@lanxincomputing.com>
 <aoxiBB2Wn8NiL5s6@x1.local>
 <5a2a8e0e-2fa6-4905-9752-b2ed0ab3f0ac@lanxincomputing.com>
 <aprI8xQIDCRTJOV1@x1.local>
 <9d125a95-0fa1-4ea8-a8a6-4869afc629bc@lanxincomputing.com>
In-Reply-To: <9d125a95-0fa1-4ea8-a8a6-4869afc629bc@lanxincomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Sep 2026 11:29:31 +0100
X-Gm-Features: AcwNN1VWk8NRxaWIEuR3tuJ59HYNQN-ogtxwUqbglZw6rDiK6gDjVvy_tPlbesI
Message-ID: <CAFEAcA-hV-eZHfH1FMYNLaFY8M-emt8aN+Nt4MvfhSfkUZv7AQ@mail.gmail.com>
Subject: Re: [PATCH v2] virtio: Add aligned ld/st accessors for vring
To: BillXiang <xiangwencheng@lanxincomputing.com>
Cc: Peter Xu <peterx@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, mst@redhat.com, 
 pbonzini@redhat.com, philmd@mailo.com, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, 7 Sept 2026 at 11:12, BillXiang
<xiangwencheng@lanxincomputing.com> wrote:
>
> On 9/4/2026 9:34 PM, Peter Xu wrote:
> > On Tue, Sep 01, 2026 at 10:44:13AM +0800, BillXiang wrote:
> >> On 8/24/2026 11:23 PM, Peter Xu wrote:
> >>> On Mon, Aug 24, 2026 at 12:19:15PM +0800, BillXiang wrote:
> >>>> Hi Richard, I've read your code in accel/tcg/ldst_atomicity.c.inc. D=
o
> >>>> you think it would be better to make the load/store_atomic* public?
> >>>
> >>> They do not fit by default, as we need to still process unaligned cas=
es?
> >>
> >> You mentioned the use of guest CPU context in [1]. However, what I mea=
nt
> >> by load/store_atomic* is code like the following:
> >>
> >> static inline uint16_t load_atomic2(void *pv)
> >> {
> >>       uint16_t *p =3D __builtin_assume_aligned(pv, 2);
> >>       return qatomic_read(p);
> >> }
> >>
> >> static inline void store_atomic2(void *pv, uint16_t val)
> >> {
> >>       uint16_t *p =3D __builtin_assume_aligned(pv, 2);
> >>       qatomic_set(p, val);
> >> }
> >>
> >> I consider these to be generic atomic load/store primitives.
> >
> > __builtin_assume_aligned() tells the compiler the address is aligned.  =
What
> > if it is not?
>
> When using __builtin_assume_aligned, the compiler will generate
> unaligned load/store instructions if the data is not aligned, rather
> than emitting byte=E2=80=91by=E2=80=91byte code, which may cause errors o=
n processors
> that do not support unaligned accesses. That's what I mean: callers must
> ensure @addr is naturally aligned to the access size.

Indeed. That's why the ldst_atomicity.c.inc code only calls them
when it can guarantee the alignment, with fallback cases for
when it isn't. Those are the lowest level internal functions
in that code, and the higher level ones are things like
load_atom_2() (which might call load_atomic2() if the address
is 2-aligned, or lduw_he_p() if it's not but the caller said
it doesn't care about getting a 2-byte-atomic load for an
unaligned pointer, or a function to do an atomic 8-byte access
and extract the 2 bytes we care about, or if all else fails
falling back to "stop all QEMU threads and do a non-atomic read".

The difficulty in generalizing that code for device use I suspect
is whether the fallback cases remain the right thing to do.

-- PMM

